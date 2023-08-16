import 'package:floor/floor.dart';
import 'package:uuid/uuid.dart';

@entity
class WeatherFromDB {
  @PrimaryKey(autoGenerate: false)
  final String id;
  final String city;
  final double temperature;
  final double windSpeed;
  final int windDirection;
  final int weatherCode;
  final int isDay;
  final String time;

  WeatherFromDB({
    required this.city,
    required this.temperature,
    required this.windSpeed,
    required this.windDirection,
    required this.weatherCode,
    required this.isDay,
    required this.time,
  }) : id = const Uuid().v4();

  @override
  String toString() {
    return 'CurrentWeather{city: $city, temperature: $temperature, windspeed: $windSpeed, '
        'winddirection: $windDirection, weathercode: $weatherCode, '
        'is_day: $isDay, time: $time}';
  }

  WeatherFromDB copyWith({
    String? cityName,
    double? temperature,
    double? windspeed,
    int? winddirection,
    int? weathercode,
    int? isDay,
    String? time,
  }) {
    return WeatherFromDB(
      city: cityName ?? city,
      temperature: temperature ?? this.temperature,
      windSpeed: windspeed ?? this.windSpeed,
      windDirection: winddirection ?? this.windDirection,
      weatherCode: weathercode ?? this.weatherCode,
      isDay: isDay ?? this.isDay,
      time: time ?? this.time,
    );
  }
}
