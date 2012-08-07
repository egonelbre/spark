unit ConverterClassDataClass;

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
    FScale : TTemperatureFormula;
  protected
    procedure Assign(const ATemperature: TTemperature);

    procedure SetScale(const AScale: TTemperatureFormula);

    function  GetTemperature(const AIndex: TTemperatureFormula): Extended;
    procedure SetTemperature(const AIndex: TTemperatureFormula; AValue : Extended);

    property Scale : TTemperatureFormula read FScale write SetScale;
  public
    constructor Create;
    property Temperature : TTemperature write Assign;

    function ScaleToString(const AIndex: TTemperatureFormula): String;

    property Value[const Index : TTemperatureFormula]: Extended read GetTemperature write SetTemperature; default;
    property ScaleName[const Index : TTemperatureFormula]: String read ScaleToString;
  end;

const
  tfCelsius    : TTemperatureFormula = ( Name: 'Celsius';    A: 0; B:1;   C:0);
  tfFahrenheit : TTemperatureFormula = ( Name: 'Fahrenheit'; A: 0; B:1.8; C:32);
  tfKelvin     : TTemperatureFormula = ( Name: 'Kelvin';     A: 273.15; B:1; C:0);

function FormulasEqual(A, B : TTemperatureFormula): Boolean;

implementation

uses ConvUtils, SysUtils;


function FormulasEqual(A, B : TTemperatureFormula): Boolean;
begin
  Result := (A.A = B.A) and (A.B = B.B) and (A.C = B.C);
end;

// Base    = (Temp - C) / B - A
// Temp    = (Base + A) * B + C

constructor TTemperature.Create;
begin
  FValue := 0;
  FScale := tfCelsius;
end;

function TTemperature.GetTemperature(const AIndex: TTemperatureFormula): Extended;
begin
  if FormulasEqual(AIndex, FScale) then
    Result := FValue
  else
  begin
    Scale := AIndex;
    Result := FValue;
  end;
end;

procedure TTemperature.SetTemperature(const AIndex: TTemperatureFormula; AValue: Extended);
begin
  FValue := AValue;
  FScale := AIndex;
end;

procedure TTemperature.SetScale(const AScale: TTemperatureFormula);
var
  lBase, lNew : Extended;
begin
  lBase := (FValue - FScale.C) / FScale.B - FScale.A;
  lNew  := (lBase + AScale.A) * AScale.B + AScale.C;

  FValue := lNew;
  FScale := AScale;
end;

procedure TTemperature.Assign(const ATemperature: TTemperature);
begin
  FValue := ATemperature.FValue;
  FScale := ATemperature.FScale;
end;

function TTemperature.ScaleToString(const AIndex: TTemperatureFormula): String;
begin
  Result := AIndex.Name;
  Delete(Result, 1, 1);
end;

end.