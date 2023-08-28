import 'dart:async';

import 'package:db/db.dart';
import 'package:weather_api_client/open_weather_map_client.dart';
import 'package:weather_api_provider/weather_api_provider.dart';

class WeatherRepository {
  WeatherRepository({WeatherApi? weatherApiClient})
      : _weatherApiClient = weatherApiClient ?? OpenWeatherMapClient(),
        _dbProvider = DbProvider() {
    _dbProvider.initializeDatabase();
  }

  final WeatherApi _weatherApiClient;
  final DbProvider _dbProvider;

  Future<WeatherFromDB> getWeatherByName(String city) async {
    final weather = await _weatherApiClient.getWeatherByName(city);
    return await saveAndReturnWeather(weather);
  }

  Future<WeatherFromDB> getWeatherByLocation(
    double latitude,
    double longitude,
  ) async {
    final weather = await _weatherApiClient.getWeatherByCoordinates(
      latitude,
      longitude,
    );
    return await saveAndReturnWeather(weather);
  }

  Future<WeatherFromDB> saveAndReturnWeather(
    OpenWeatherResponse weather,
  ) async {
    final modifiedWeather = weather.toDb();
    await _dbProvider.createWeather(modifiedWeather);
    print('database action: successfully added weather');

    return modifiedWeather;
  }

  Stream<List<WeatherFromDB>> getWeathers() => _dbProvider.getWeathers();

  Future<void> deleteWeather(String id) => _dbProvider.deleteWeather(id);

  Future<void> undoDeletion(String id) => _dbProvider.undoDeletion(id);

  Future<void> deleteAll() => _dbProvider.deleteAll();
}

extension on OpenWeatherResponse {
  WeatherFromDB toDb() {
    return WeatherFromDB(
      city: this.cityName,
      temperature: this.main.temp - 273.15,
      windSpeed: this.wind.speed,
      mainDescription: this.weather[0].main,
      description: this.weather[0].description,
      pressure: this.main.pressure,
      humidity: this.main.humidity,
      visibility: this.visibility,
      minTemp: this.main.tempMin - 273.15,
      maxTemp: this.main.tempMax - 273.15,
      feelsLike: this.main.feelsLike - 273.15,
      lastUpdated: DateTime.now(),
      sunrise: DateTime.fromMillisecondsSinceEpoch(
        this.sys.sunrise * 10000,
        isUtc: true,
      ),
      sunset: DateTime.fromMillisecondsSinceEpoch(
        this.sys.sunset * 10000,
        isUtc: true,
      ),
      imageUrl: 'http://openweathermap.org/img/w/${weather[0].icon}.png',
    );
  }
}
