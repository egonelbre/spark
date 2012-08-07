unit ConverterClasses;

interface

type
  TTemperature = class
  private
    FValue : Extended;
  protected
    class function ToCelsius(AValue: Extended): Extended; virtual; abstract;
    class function FromCelsius(AValue: Extended): Extended; virtual; abstract;  
  public
    constructor Create(AValue: Extended = 0.0);
    procedure AssignTemperature(ATemperature: TTemperature);
    property Value: Extended read FValue write FValue;
    property Temperature: TTemperature write AssignTemperature;
  end;
  
  TCelsius = class(TTemperature)
  protected
    class function ToCelsius(AValue: Extended): Extended; override;
    class function FromCelsius(AValue: Extended): Extended; override;  
  end;
  
  TFahrenheit = class(TTemperature)
  protected
    class function ToCelsius(AValue: Extended): Extended; override;
    class function FromCelsius(AValue: Extended): Extended; override;    
  end;
  
  TKelvin = class(TTemperature)
  protected
    class function ToCelsius(AValue: Extended): Extended; override;
    class function FromCelsius(AValue: Extended): Extended; override;  
  end;
  
implementation
//	              from Celsius	                  to Celsius
//  Fahrenheit    [F] = [C] x 9/5 + 32	          [C] = ([F] - 32) x 5/9
//  Kelvin        [K] = [C] + 273.15	            [C] = [K] - 273.15
//  Rankine	      [R] = ([C] + 273.15) x 9/5	    [C] = ([R] - 491.67) x 5/9

constructor TTemperature.Create(AValue: Extended);
begin
  FValue := AValue;
end;

procedure TTemperature.AssignTemperature(ATemperature: TTemperature);
var
  lCelsius: Extended;
begin
  lCelsius := ATemperature.ToCelsius(ATemperature.Value);
  Value := Self.FromCelsius(lCelsius);
end;

class function TCelsius.ToCelsius(AValue: Extended): Extended;
begin
  Result := AValue;
end;

class function TCelsius.FromCelsius(AValue: Extended): Extended;
begin
  Result := AValue;
end;

class function TFahrenheit.ToCelsius(AValue: Extended): Extended;
begin
  Result := (AValue - 32) * 5 / 9;
end;

class function TFahrenheit.FromCelsius(AValue: Extended): Extended;
begin
  Result := AValue * 9 / 5 + 32;
end;

class function TKelvin.ToCelsius(AValue: Extended): Extended;
begin
  Result := AValue + 273.15;
end;

class function TKelvin.FromCelsius(AValue: Extended): Extended;
begin
  Result := AValue - 273.15;
end;

end.