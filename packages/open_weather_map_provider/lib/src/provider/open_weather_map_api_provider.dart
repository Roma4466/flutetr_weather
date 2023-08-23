import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_api/weather_api.dart';

part 'open_weather_map_api_provider.g.dart';

@RestApi(baseUrl: "https://api.openweathermap.org/")
abstract class OpenWeatherMapApiProvider {
  factory OpenWeatherMapApiProvider(Dio dio, {String baseUrl}) =
      _OpenWeatherMapApiProvider;

  @GET("data/2.5/weather")
  Future<OpenWeatherResponse> loadWeatherByName(
    @Query("q") String cityCountry,
    @Query("appid") String keyApi,
  );

  @GET("data/2.5/weather")
  Future<OpenWeatherResponse> loadWeatherByCoordinates(
    @Query("lat") double latitude,
    @Query("lon") double longitude,
    @Query("appid") String keyApi,
  );
}
