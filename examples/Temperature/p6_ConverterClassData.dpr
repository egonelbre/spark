program ConverterClassDataTest;
{$APPTYPE CONSOLE}

uses
  ConverterClassData, SysUtils;

var
  lTemp: TTemperature;
  lConvertFrom: Integer;
  lValue: Extended;
  i : integer;
begin
  lTemp := TTemperature.Create;
  try
    lTemp.LoadFromFile('Conversion.csv');
    writeln('Scales:');
    for i := 0 to lTemp.Count - 1 do
      writeln(i, '. ' + lTemp.ScaleName[i]);
    writeln;
    write('Choose scale to convert from: ');
    readln(lConvertFrom);
    if (lConvertFrom < 0) or (lConvertFrom >= lTemp.Count) then
    begin
      writeln('Invalid scale.');
      exit;                                       
    end;

    lValue := 1;
    while lValue <> 0 do
    begin                                                                 
      writeln('---------------------------------');
      write('Value in  [' + lTemp.ScaleName[lConvertFrom] + '] '#9'? ');
      readln(lValue);
      lTemp[lConvertFrom] := lValue;
      for i := 0 to lTemp.Count - 1 do
      begin          
        writeln('Value out [' + lTemp.ScaleName[i] + '] '#9': ', FloatToStr(lTemp[i]));
      end;
    end;
  finally
    lTemp.Free;
  end;
  readln;
end.