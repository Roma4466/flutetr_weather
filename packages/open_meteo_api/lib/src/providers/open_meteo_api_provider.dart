import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/models.dart';

part 'open_meteo_api_provider.g.dart';

@RestApi(baseUrl: "https://api.open-meteo.com/v1")
abstract class OpenMeteoApiProvider {
  factory OpenMeteoApiProvider(Dio dio, {String baseUrl}) =
      _OpenMeteoApiProvider;

  @GET("/forecast")
  Future<WeatherEntity> getWeather(
    @Query("latitude") double latitude,
    @Query("longitude") double longitude,
    @Query("current_weather") bool currentWeather,
  );
}
