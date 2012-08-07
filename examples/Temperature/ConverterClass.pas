unit ConverterClass;

interface

type
  TTemperature = class
  private
    FCelsius : Extended;
  protected
    procedure Assign(AValue: TTemperature);
    
    function  GetCelsius: Extended;
    procedure SetCelsius(AValue : Extended);
    
    function  GetKelvin: Extended;
    procedure SetKelvin(AValue : Extended);
    
    function  GetFahrenheit: Extended;
    procedure SetFahrenheit(AValue : Extended);
  public
    constructor Create;
    property Temperature : TTemperature write Assign;
    
    property Celsius : Extended read GetCelsius write SetCelsius;
    property Fahrenheit : Extended read GetFahrenheit write SetFahrenheit;
    property Kelvin: Extended read GetKelvin write SetKelvin;
  end;
  
implementation

//	              from Celsius	                  to Celsius
//  Fahrenheit    [F] = [C] x 9/5 + 32	          [C] = ([F] - 32) x 5/9
//  Kelvin        [K] = [C] + 273.15	            [C] = [K] - 273.15
//  Rankine	      [R] = ([C] + 273.15) x 9/5	    [C] = ([R] - 491.67) x 5/9

constructor TTemperature.Create;
begin
  FCelsius := 0;
end;

function TTemperature.GetCelsius: Extended;
begin
  Result := FCelsius;
end;

procedure TTemperature.SetCelsius(AValue: Extended);
begin
  FCelsius := AValue;
end;

function TTemperature.GetKelvin: Extended;
begin
  Result := FCelsius + 273.15;
end;

procedure TTemperature.SetKelvin(AValue: Extended);
begin
  FCelsius := AValue - 273.15;
end;

function TTemperature.GetFahrenheit: Extended;
begin
  Result := FCelsius * 9 / 5 + 32;
end;

procedure TTemperature.SetFahrenheit(AValue: Extended);
begin
  FCelsius := (AValue - 32) * 5 / 9;
end;

procedure TTemperature.Assign(AValue: TTemperature);
begin
  FCelsius := AValue.FCelsius;
end;

end.