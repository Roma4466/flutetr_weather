import 'package:dio/dio.dart';
import 'package:open_meteo_api/open_meteo_api.dart';
import 'package:retrofit/retrofit.dart';

part 'geocoding_api_provider.g.dart';

@RestApi(baseUrl: "https://geocoding-api.open-meteo.com/v1")
abstract class GeocodingApiProvider {
  factory GeocodingApiProvider(Dio dio, {String baseUrl}) = _GeocodingApiProvider;

  @GET("/search")
  Future<GeocodingResponse> searchPlace(
      @Query("name") String name,
      @Query("count") int count,
      );
}