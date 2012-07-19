program log7;

// doing logging without closures in Delphi 7

{$APPTYPE CONSOLE}
{$TYPEINFO ON}

uses
  SysUtils,
  Windows,
  TypInfo,
  Math;

type
  TLogFn = procedure(AFormat: String; AArgs : array of const) of object;

  TLog = class
  private
    FName : String;
  public
    procedure Log(AFormat : String; AArgs : array of const);
    property Name: String read FName write FName;
  end;

  TLogger = class
  private
    FLogs : array of TLog;
    procedure CreateFns;
  protected
    function GetFn(AIndex : Integer): TLogFn;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TMyLogger = class(TLogger)
  published
    property Render : TLogFn index 0 read GetFn;
    property Alpha : TLogFn index 1 read GetFn;
    property Gamma : TLogFn index 2 read GetFn;
    property Delta : TLogFn index 3 read GetFn;
  end;

{ TLogger }

constructor TLogger.Create;
begin
  SetLength(FLogs, 0);
  CreateFns;
end;

procedure TLogger.CreateFns;
var
  i, lCount, lSize: Integer;
  lList: PPropList;
  lInfo: TPropInfo;
  lName : string;
begin
  lSize := GetTypeData(Self.ClassInfo)^.PropCount;
  if lSize > 0 then
  begin
    GetMem(lList, lSize * SizeOf(Pointer));
    try
      lCount := GetPropList(ClassInfo, tkMethods, lList);
      for i := 0 to lCount - 1 do
        try
          lInfo := lList^[i]^;
          if lInfo.Index + 1 > length(FLogs) then
            SetLength(FLogs, lInfo.Index + 1);

          FLogs[lInfo.Index] := TLog.Create;
          FLogs[lInfo.Index].FName := lInfo.Name;
        except
        end;
    finally
      FreeMem(lList, lSize * SizeOf(Pointer));
    end;
  end;
end;

destructor TLogger.Destroy;
var
  i : integer;
begin
  inherited;
  for i := 0 to high(FLogs) do
    FLogs[i].Free;
end;

function TLogger.GetFn(AIndex: Integer): TLogFn;
begin
  Result := FLogs[AIndex].Log;
end;

{ TLog }

procedure TLog.Log(AFormat: String; AArgs: array of const);
begin
  Writeln(Format(AFormat, AArgs));
end;

var
  log : TMyLogger;
begin
  log := TMyLogger.Create;
  log.Render('Blah', []);
  log.Render('Somex', []);
  log.Render('Rofff', []);

  readln;
end.
