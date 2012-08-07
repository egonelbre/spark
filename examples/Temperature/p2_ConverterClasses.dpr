program ConverterClassesTest;
{$APPTYPE CONSOLE}
uses
  ConverterClasses;

var
  lCelsius: TCelsius;
  lKelvin: TKelvin;
  lFahrenheit: TFahrenheit;
begin
  lCelsius := TCelsius.Create(5.0);
  lFahrenheit := TFahrenheit.Create;
  lKelvin := TKelvin.Create;
  
  writeln(lCelsius.Value);
  
  lKelvin.Temperature := lCelsius;
  
  writeln(lKelvin.Value);
  
  lFahrenheit.Temperature := lKelvin;
  lFahrenheit.Temperature := lFahrenheit;
  
  writeln(lFahrenheit.Value);
  
  lCelsius.Temperature := lFahrenheit;
  
  writeln(lCelsius.Value);
  
  lCelsius.Free;
  lFahrenheit.Free;
  lKelvin.Free;

  readln;
end.