program ConverterClassDataClassTest;
{$APPTYPE CONSOLE}

uses
  ConverterClassDataClass, SysUtils;

const
  tfRankine : TTemperatureFormula = (Name: 'Rankine'; A: 273.15; B:1.8; C:0);

var
  lTemp: TTemperature;
  lTemp2 : TTemperature;

begin
  lTemp := TTemperature.Create;
  lTemp2 := TTemperature.Create;
  lTemp.Value[tfCelsius] := 300;
  writeln(FloatToStr(lTemp.Value[tfFahrenheit]));
  writeln(FloatToStr(lTemp.Value[tfKelvin]));  

  lTemp2.Temperature := lTemp;

  writeln(FloatToStr(lTemp2.Value[tfCelsius]));
  writeln(FloatToStr(lTemp2.Value[tfFahrenheit]));
  writeln(FloatToStr(lTemp2.Value[tfRankine]));
                                                        
  lTemp.Free;
  lTemp2.Free;

  readln;
end.