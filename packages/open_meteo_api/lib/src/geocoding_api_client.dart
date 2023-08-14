import 'dart:async';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:open_meteo_api/open_meteo_api.dart';
import 'package:open_meteo_api/src/providers/open_meteo_api_provider.dart';

import 'models/models.dart';
import 'providers/geocoding_api_provider.dart';

final logger = Logger();

void main(List<String> args) async {
  final dio = Dio();
  dio.options.headers["Demo-Header"] = "demo header";
  final client = GeocodingApiProvider(dio);
  final apiClient = OpenMeteoApiProvider(dio);

  final result = await client.searchPlace('Chicago', 1);

  for (final i in result.results) {
    logger.i(i);
  }

  final newResult = await apiClient.getWeather(
    result.results.first.latitude,
    result.results.first.longitude,
    true,
  );
  logger.i(newResult);
}

class LocationRequestFailure implements Exception {}

class LocationNotFoundFailure implements Exception {}

class WeatherRequestFailure implements Exception {}

class WeatherNotFoundFailure implements Exception {}

class OpenMeteoApiClient {
  final GeocodingApiProvider geocodingApiProvider;
  final OpenMeteoApiProvider openMeteoApiProvider;

  OpenMeteoApiClient()
      : geocodingApiProvider = _createGeocodingApiProvider(),
        openMeteoApiProvider = _createOpenMeteoApiProvider();

  static GeocodingApiProvider _createGeocodingApiProvider() {
    final dio = Dio();
    dio.options.headers["Demo-Header"] = "demo header";
    return GeocodingApiProvider(dio);
  }

  static OpenMeteoApiProvider _createOpenMeteoApiProvider() {
    final dio = Dio();
    dio.options.headers["Demo-Header"] = "demo header";
    return OpenMeteoApiProvider(dio);
  }

  Future<GeocodingResult> locationSearch(String city) async {
    try {
      print('weatherResponse: ');
      final weatherResponse = await geocodingApiProvider.searchPlace(city, 1);
      print('weatherResponse: $weatherResponse');
      if (weatherResponse.results.isEmpty) throw LocationNotFoundFailure();
      return weatherResponse.results.first;
    } catch (_) {
      throw LocationRequestFailure();
    }
  }

  Future<WeatherEntity> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final weatherResponse =
          await openMeteoApiProvider.getWeather(latitude, longitude, true);
      return weatherResponse;
    } catch (_) {
      throw WeatherRequestFailure();
    }
  }
}
