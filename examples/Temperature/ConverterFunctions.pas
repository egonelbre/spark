unit ConverterFunctions;
interface

function ConvertCelsiusToFahrenheit(AValue:Extended): Extended;
function ConvertFahrenheitToCelsius(AValue:Extended): Extended;

function ConvertCelsiusToKelvin(AValue: Extended): Extended;
function ConvertKelvinToCelsius(AValue: Extended): Extended;

function ConvertFahrenheitToKelvin(AValue: Extended): Extended;
function ConvertKelvinToFahrenheit(AValue: Extended): Extended;

implementation

//	              from Celsius	                  to Celsius
//  Fahrenheit    [F] = [C] x 9/5 + 32	          [C] = ([F] - 32) x 5/9
//  Kelvin        [K] = [C] + 273.15	            [C] = [K] - 273.15
//  Rankine	      [R] = ([C] + 273.15) x 9/5	    [C] = ([R] - 491.67) x 5/9

function ConvertCelsiusToFahrenheit(AValue:Extended): Extended;
begin
  Result := AValue * 9 / 5 + 32;
end;

function ConvertFahrenheitToCelsius(AValue:Extended): Extended;
begin
  Result := (AValue - 32) * 5/9;
end;

function ConvertCelsiusToKelvin(AValue:Extended): Extended;
begin
  Result := AValue + 273.15;
end;

function ConvertKelvinToCelsius(AValue:Extended): Extended;
begin
  Result := AValue - 273.15;
end;

function ConvertFahrenheitToKelvin(AValue:Extended): Extended;
begin
  Result := ConvertFahrenheitToCelsius(AValue);
  Result := ConvertCelsiusToKelvin(Result);
end;

function ConvertKelvinToFahrenheit(AValue:Extended): Extended;
begin
  Result := ConvertKelvinToCelsius(AValue);
  Result := ConvertCelsiusToFahrenheit(Result);
end;

end.