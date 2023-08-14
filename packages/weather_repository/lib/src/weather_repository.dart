import 'dart:async';

import 'package:db/db/db.dart';
import 'package:db/db_provider.dart';
import 'package:open_meteo_api/open_meteo_api.dart';
import 'package:weather_repository/weather_repository.dart';

class WeatherRepository {
  WeatherRepository({OpenMeteoApiClient? weatherApiClient})
      : _weatherApiClient = weatherApiClient ?? OpenMeteoApiClient(),
        _dbProvider = DbProvider() {
    _dbProvider.initializeDatabase();
  }

  final OpenMeteoApiClient _weatherApiClient;
  final DbProvider _dbProvider;

  Future<WeatherForRepository> getWeather(String city) async {
    final location = await _weatherApiClient.locationSearch(city);
    final weather = await _weatherApiClient.getWeather(
      latitude: location.latitude,
      longitude: location.longitude,
    );

    _dbProvider.createWeather(weather.toDb());

    return WeatherForRepository(
      temperature: weather.current_weather.temperature,
      location: location.name,
      condition: weather.current_weather.weathercode.toInt().toCondition,
    );
  }

  Stream<List<WeatherForDB>> getWeathers() => _dbProvider.getWeathers();
}

extension on WeatherEntity {
  WeatherForDB toDb() {
    return WeatherForDB(
      temperature: this.current_weather.temperature,
      windspeed: this.current_weather.temperature,
      winddirection: this.current_weather.winddirection,
      weathercode: this.current_weather.weathercode,
      is_day: this.current_weather.is_day,
      time: this.current_weather.time,
    );
  }
}

extension on int {
  WeatherCondition get toCondition {
    switch (this) {
      case 0:
        return WeatherCondition.clear;
      case 1:
      case 2:
      case 3:
      case 45:
      case 48:
        return WeatherCondition.cloudy;
      case 51:
      case 53:
      case 55:
      case 56:
      case 57:
      case 61:
      case 63:
      case 65:
      case 66:
      case 67:
      case 80:
      case 81:
      case 82:
      case 95:
      case 96:
      case 99:
        return WeatherCondition.rainy;
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return WeatherCondition.snowy;
      default:
        return WeatherCondition.unknown;
    }
  }
}
