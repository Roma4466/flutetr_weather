// ignore_for_file: prefer_const_constructors
import 'package:open_weather_map_provider/open_weather_map_provider.dart';
import 'package:test/test.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';


void main() {
  final logger = Logger();
  final dio = Dio();
  dio.options.headers["Demo-Header"] = "demo header";
  final client = OpenWeatherMapClient();
  group('OpenWeatherMapProvider', () {
    test('can be instantiated', () {
      expect(OpenWeatherMapClient(), isNotNull);
    });

    test('can get weather', () async {
      final result = await client.getWeatherByName('Kyiv');
      logger.i(result);
    });
  });
}
