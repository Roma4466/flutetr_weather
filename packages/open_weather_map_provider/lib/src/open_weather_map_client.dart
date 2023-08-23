import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:open_weather_map_provider/src/provider/open_weather_map_api_provider.dart';
import 'package:weather_api/weather_api.dart';

class OpenWeatherMapClient implements WeatherApi {
  final OpenWeatherMapApiProvider openWeatherMapApiProvider;

  OpenWeatherMapClient()
      : openWeatherMapApiProvider = _createOpenWeatherMapApiProvider();

  static OpenWeatherMapApiProvider _createOpenWeatherMapApiProvider() {
    final dio = Dio();
    dio.options.headers["Demo-Header"] = "demo header";
    return OpenWeatherMapApiProvider(dio);
  }

  @override
  Future<OpenWeatherResponse> getWeatherByCoordinates(
    double latitude,
    double longitude,
  ) async {
    // final keyApi = dotenv.env['OPEN_WEATHER_MAP_API_KEY']!;
    return await openWeatherMapApiProvider.loadWeatherByCoordinates(
        latitude, longitude, "6b0423304b20ad534ccceecc6d3c729a");
  }

  @override
  Future<OpenWeatherResponse> getWeatherByName(String city) async {
    // final keyApi = dotenv.env['OPEN_WEATHER_MAP_API_KEY']!;
    return await openWeatherMapApiProvider.loadWeatherByName(
        city, "6b0423304b20ad534ccceecc6d3c729a");
  }
}

void main() async {
  final logger = Logger();
  final dio = Dio();
  dio.options.headers["Demo-Header"] = "demo header";
  final client = OpenWeatherMapClient();

  final result = await client.getWeatherByName('Kyiv');
  logger.i(result);
}
