unit ConverterClassFastIndex;

interface

type
  TTemperatureScale = (tsCelsius, tsFahrenheit, tsKelvin);
const
  cTemperatureString: array[TTemperatureScale] of String = ('Celsius', 'Fahrenheit', 'Kelvin');

type
  TTemperature = class
  private
    FValue : Extended;
    FScale : TTemperatureScale;
  protected
    procedure Assign(ATemperature: TTemperature);
    
    procedure SetScale(AScale: TTemperatureScale);
    
    function  GetTemperature(AIndex: TTemperatureScale): Extended;
    procedure SetTemperature(AIndex: TTemperatureScale; AValue : Extended);
    
    property Scale : TTemperatureScale read FScale write SetScale;
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
  FValue := 0;
  FScale := tsCelsius;
end;

function TTemperature.GetTemperature(AIndex: TTemperatureScale): Extended;
begin
  if Scale = AIndex then
    Result := FValue
  else
  begin
    Scale := AIndex;
    Result := FValue;
  end;
end;

procedure TTemperature.SetTemperature(AIndex: TTemperatureScale; AValue: Extended);
begin
  FValue := AValue;
  FScale := AIndex;
end;

procedure TTemperature.SetScale(AScale: TTemperatureScale);
var
  lCelsius: Extended;
begin
  // convert to celsius
  case FScale of
    tsCelsius    : lCelsius := FValue;
    tsFahrenheit : lCelsius := FValue * 9 / 5 + 32;
    tsKelvin     : lCelsius := FValue + 273.15;
  else
    raise EConversionError.Create('Unknown scale!');
  end;

  // convert from celsius
  case AScale of
    tsCelsius    : FValue := lCelsius;
    tsFahrenheit : FValue := (lCelsius - 32) * 5 / 9;
    tsKelvin     : FValue := lCelsius - 273.15;
  else
    raise EConversionError.Create('Unknown scale!');
  end;
  
  // modify scale
  FScale := AScale;
end;

procedure TTemperature.Assign(ATemperature: TTemperature);
begin
  FValue := ATemperature.FValue;
  FScale := ATemperature.FScale;
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