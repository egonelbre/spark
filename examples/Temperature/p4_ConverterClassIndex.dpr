program ConverterClassIndexTest;
{$APPTYPE CONSOLE}

uses
  ConverterClassIndex;

  function ConvertFromTo(AFrom, ATo: String; AValue : Extended): Extended;
  var
    lTemp : TTemperature;
    lFrom, lTo : TTemperatureScale;
  begin
    lTemp := TTemperature.Create;
    
    lFrom := lTemp.StringToScale(AFrom);
    lTo := lTemp.StringToScale(ATo);
    
    lTemp[lFrom] := AValue;
    Result := lTemp[lTo];
    
    lTemp.Free;
  end;

var
  lTemp: TTemperature;
begin
  lTemp := TTemperature.Create;
  lTemp.Celsius := 5.0;
  
  writeln(lTemp.Celsius);
  writeln(lTemp.Kelvin);
  writeln(lTemp.Fahrenheit);

  lTemp.Kelvin := 5.0;
  
  writeln(lTemp.Celsius);
  writeln(lTemp.Kelvin);
  writeln(lTemp.Fahrenheit);

  lTemp.Free;

  readln;
end.