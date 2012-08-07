program ConverterFunctionsTest;
{$APPTYPE CONSOLE}

uses
  ConverterFunctions;

var
  lCelsius: Extended;
  lTemp : Extended;
begin
  lCelsius := 5.8;
  lTemp := ConvertCelsiusToKelvin(lCelsius);
  writeln(lTemp);
  lTemp := ConvertKelvinToFahrenheit(lTemp);
  writeln(lTemp);
  lTemp := ConvertCelsiusToFahrenheit(lTemp);
  writeln(lTemp);
  readln;
end.