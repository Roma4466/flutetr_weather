
import 'package:weather_repository/weather_repository.dart';

extension ToCondition on String {
  WeatherCondition get toCondition {
    switch (this) {
      case 'Clear':
        return WeatherCondition.clear;
      case 'Clouds':
        return WeatherCondition.cloudy;
      case 'Rain':
        return WeatherCondition.rainy;
      case 'Snowy':
        return WeatherCondition.snowy;
      case 'Thunderstorm':
        return WeatherCondition.thunder;
      case 'Drizzle':
        return WeatherCondition.drizzle;
      case 'Mist':
        return WeatherCondition.mist;
      default:
        return WeatherCondition.unknown;
    }
  }
}