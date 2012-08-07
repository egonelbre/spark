unit ConverterClassIndex;

interface

type
  TTemperatureScale = (tsCelsius, tsFahrenheit, tsKelvin);
const
  cTemperatureString: array[TTemperatureScale] of String = ('Celsius', 'Fahrenheit', 'Kelvin');

type
  TTemperature = class
  private
    FCelsius : Extended;
  protected
    procedure Assign(AValue: TTemperature);
    
    function  GetTemperature(AIndex: TTemperatureScale): Extended;
    procedure SetTemperature(AIndex: TTemperatureScale; AValue : Extended);
  public
    constructor Create;
    property Temperature : TTemperature write Assign;
    
    class function StringToScale(AValue: String): TTemperatureScale;
    class function ScaleToString(AValue: TTemperatureScale): String;
    
    property Value[Index : TTemperatureScale]: Extended read GetTemperature write SetTemperature; default;
    property Celsius : Extended index tsCelsius read GetTemperature write SetTemperature;
    property Fahrenheit : Extended index tsFahrenheit read GetTemperature write SetTemperature;
    property Kelvin: Extended index tsKelvin read GetTemperature write SetTemperature;
  end;

implementation

uses ConvUtils;

//	              from Celsius	                  to Celsius
//  Fahrenheit    [F] = [C] x 9/5 + 32	          [C] = ([F] - 32) x 5/9
//  Kelvin        [K] = [C] + 273.15	            [C] = [K] - 273.15
//  Rankine	      [R] = ([C] + 273.15) x 9/5	    [C] = ([R] - 491.67) x 5/9

constructor TTemperature.Create;
begin
  FCelsius := 0;
end;

function TTemperature.GetTemperature(AIndex: TTemperatureScale): Extended;
begin
  case AIndex of
    tsCelsius    : Result := FCelsius;
    tsFahrenheit : Result := FCelsius * 9 / 5 + 32;
    tsKelvin     : Result := FCelsius + 273.15;
  else
    raise EConversionError.Create('Unknown scale!');
  end
end;

procedure TTemperature.SetTemperature(AIndex: TTemperatureScale; AValue: Extended);
begin
  case AIndex of
    tsCelsius    : FCelsius := AValue;
    tsFahrenheit : FCelsius := (AValue - 32) * 5 / 9;
    tsKelvin     : FCelsius := AValue - 273.15;
  else
    raise EConversionError.Create('Unknown scale!');
  end
end;

procedure TTemperature.Assign(AValue: TTemperature);
begin
  FCelsius := AValue.FCelsius;
end;

class function TTemperature.StringToScale(AValue: String): TTemperatureScale;
var
  i : TTemperatureScale;
begin
  for i := low(TTemperatureScale) to high(TTemperatureScale) do
    if AValue = cTemperatureString[i] then
    begin
      Result := i;
      exit;
    end;
  raise EConversionError.Create('Unknown scale!');
end;

class function TTemperature.ScaleToString(AValue: TTemperatureScale): String;
begin
  Result := cTemperatureString[AValue];
end;

end.