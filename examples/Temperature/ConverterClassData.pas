unit ConverterClassData;

interface

uses
  Classes;

type
  TTemperatureFormula = record
    Name : String;
    A : Extended;
    B : Extended;
    C : Extended;
  end;

  TTemperature = class
  private
    FValue : Extended;
    FScale : Integer;
    FFormulas : array of TTemperatureFormula;
    function GetCount: Integer;
  protected
    procedure Assign(ATemperature: TTemperature);
    
    procedure SetScale(AScale: Integer);
    
    function  GetTemperature(AIndex: Integer): Extended;
    procedure SetTemperature(AIndex: Integer; AValue : Extended);
    
    property Scale : Integer read FScale write SetScale;
  public
    constructor Create;
    property Temperature : TTemperature write Assign;

    procedure LoadFromFile(AFilename: String);
    function StringToScale(AValue: String): Integer;
    function ScaleToString(AIndex: Integer): String;
    
    property Value[Index : Integer]: Extended read GetTemperature write SetTemperature; default;
    property ScaleName[Index : Integer]: String read ScaleToString;
    property Count : Integer read GetCount;
  end;

implementation

uses ConvUtils, SysUtils;

// CSV:
//   Name, A, B, C
// Base    = (Temp - C) / B - A
// Temp    = (Base + A) * B + C

constructor TTemperature.Create;
begin
  FValue := 0;
  FScale := 0;
  SetLength(FFormulas, 0);
end;

function TTemperature.GetTemperature(AIndex: Integer): Extended;
begin
  if Scale = AIndex then
    Result := FValue
  else
  begin
    Scale := AIndex;
    Result := FValue;
  end;
end;

procedure TTemperature.SetTemperature(AIndex: Integer; AValue: Extended);
begin
  FValue := AValue;
  FScale := AIndex;
end;

procedure TTemperature.SetScale(AScale: Integer);
var
  lBase, lNew : Extended;
  lCur, lTo: TTemperatureFormula;
begin
  lCur := FFormulas[FScale];
  lTo  := FFormulas[AScale];

  lBase := (FValue - lCur.C) / lCur.B - lCur.A;
  lNew  := (lBase + lTo.A) * lTo.B + lTo.C;

  FValue := lNew;
  FScale := AScale;
end;

procedure TTemperature.Assign(ATemperature: TTemperature);
begin
  FValue := ATemperature.FValue;
  FScale := ATemperature.FScale;
end;

function TTemperature.StringToScale(AValue: String): Integer;
var
  i : Integer;
begin
  for i := low(FFormulas) to high(FFormulas) do
    if AValue = FFormulas[i].Name then
    begin
      Result := i;
      exit;
    end;
  raise EConversionError.Create('Unknown scale!');
end;

function TTemperature.ScaleToString(AIndex: Integer): String;
begin
  Result := FFormulas[AIndex].Name;
end;

function TTemperature.GetCount: Integer;
begin
  Result := length(FFormulas);
end;

procedure TTemperature.LoadFromFile(AFilename: String);

  // just parsing, nothing interesting here

  procedure ProcessLine(ALine: String);
  var
    p : Integer;
    name : String;
    a : String;
    b : String;
    c : String;
    f : TTemperatureFormula;
  begin
    // I was too lazy to write less
    if trim(ALine) = '' then exit;
    p := pos(',', ALine);
    if p < 1 then exit;
    name := trim(copy(ALine, 1, p - 1));
    Delete(ALine, 1, p);
    p := pos(',', ALine);
    if p < 1 then exit;
    a := trim(copy(ALine, 1, p - 1));
    Delete(ALine, 1, p);
    p := pos(',', ALine);
    if p < 1 then exit;
    b := trim(copy(ALine, 1, p - 1));
    Delete(ALine, 1, p);
    c := trim(ALine);

    f.name := name;
    f.a := StrToFloatDef(a, 0);
    f.b := StrToFloatDef(b, 1);
    if f.b = 0 then f.b := 1.0; // avoid div by 0
    f.c := StrToFloatDef(c, 0);

    SetLength(FFormulas, length(FFormulas) + 1);
    FFormulas[high(FFormulas)] := f;
  end;

var
  list : TStringList;
  i : Integer;
begin
  list := TStringList.Create;
  try
    list.LoadFromFile(AFileName);
    for i := 0 to list.count - 1 do
      ProcessLine(list[i]);
  finally
    list.Free;
  end;
end;

end.