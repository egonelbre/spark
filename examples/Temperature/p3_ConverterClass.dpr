program ConverterClassTest;
{$APPTYPE CONSOLE}

uses
  ConverterClass;

  function ConvertFromTo(AFrom, ATo: String; AValue : Extended): Extended;
  var
    lTemp : TTemperature;
  begin
    lTemp := TTemperature.Create;

    Result := AValue;

    if AFrom = 'Celsius' then
      lTemp.Celsius := AValue
    else if AFrom = 'Kelvin' then
      lTemp.Kelvin := AValue
    else if AFrom = 'Fahrenheit' then
      lTemp.Fahrenheit := AValue
    else
      writeln('Unkown scale!');

    if AFrom = 'Celsius' then
      Result := lTemp.Celsius
    else if AFrom = 'Kelvin' then
      Result := lTemp.Kelvin
    else if AFrom = 'Fahrenheit' then
      Result := lTemp.Fahrenheit
    else
      writeln('Unkown scale!');

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
end.