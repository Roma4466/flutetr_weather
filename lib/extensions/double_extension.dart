
import '../weather_pages/weather/weather.dart';

extension TemteratureUnits on double {
  double toFahrenheit() => (this * 9 / 5) + 32;

  double toCelsius() => (this - 32) * 5 / 9;

  double formatted(TemperatureUnits units) => units.isCelsius
      ? this
      : this.toFahrenheit();

  double toggle(TemperatureUnits units) => units.isCelsius
      ? this.toCelsius()
      : this.toFahrenheit();
}