import 'dart:async';

import 'package:db/db/db.dart';
import 'package:db/db_provider.dart';
import 'package:open_meteo_api/open_meteo_api.dart';

class WeatherRepository {
  WeatherRepository({OpenMeteoApiClient? weatherApiClient})
      : _weatherApiClient = weatherApiClient ?? OpenMeteoApiClient(),
        _dbProvider = DbProvider() {
    _dbProvider.initializeDatabase();
  }

  final OpenMeteoApiClient _weatherApiClient;
  final DbProvider _dbProvider;

  Future<WeatherFromDB> getWeather(String city) async {
    final location = await _weatherApiClient.locationSearch(city);
    final weather = await _weatherApiClient.getWeather(
      latitude: location.latitude,
      longitude: location.longitude,
    );

    final modifiedWeather = weather.toDb(location.name);
    _dbProvider.createWeather(modifiedWeather);
    print('database action: successfully added weather');
    final weathers = await _dbProvider.getWeathersInList();
    for(final i in weathers){
      print(i.toString());
    }

    return modifiedWeather;
  }

  Stream<List<WeatherFromDB>> getWeathers() => _dbProvider.getWeathers();
}

extension on WeatherEntity {
  WeatherFromDB toDb(String city) {
    return WeatherFromDB(
      city: city,
      temperature: this.current_weather.temperature,
      windSpeed: this.current_weather.temperature,
      windDirection: this.current_weather.winddirection,
      weatherCode: this.current_weather.weathercode,
      isDay: this.current_weather.is_day,
      time: this.current_weather.time,
    );
  }
}
