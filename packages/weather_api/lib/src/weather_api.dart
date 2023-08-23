import 'models/models.dart';

abstract class WeatherApi {
  const WeatherApi();

  Future<OpenWeatherResponse> getWeatherByName(String city);

  Future<OpenWeatherResponse> getWeatherByCoordinates(
    double latitude,
    double longitude,
  );
}
