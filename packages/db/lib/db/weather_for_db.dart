import 'package:floor/floor.dart';
import 'package:uuid/uuid.dart';

@entity
class WeatherForDB {
  @PrimaryKey(autoGenerate: true)
  final String id;
  final double temperature;
  final double windspeed;
  final int winddirection;
  final int weathercode;
  final int is_day;
  final String time;

  WeatherForDB({
    required this.temperature,
    required this.windspeed,
    required this.winddirection,
    required this.weathercode,
    required this.is_day,
    required this.time,
  }): id = const Uuid().v4();

  @override
  String toString() {
    return 'CurrentWeather{temperature: $temperature, windspeed: $windspeed, '
        'winddirection: $winddirection, weathercode: $weathercode, '
        'is_day: $is_day, time: $time}';
  }

  WeatherForDB copyWith({
    double? temperature,
    double? windspeed,
    int? winddirection,
    int? weathercode,
    int? is_day,
    String? time,
  }) {
    return WeatherForDB(
      temperature: temperature ?? this.temperature,
      windspeed: windspeed ?? this.windspeed,
      winddirection: winddirection ?? this.winddirection,
      weathercode: weathercode ?? this.weathercode,
      is_day: is_day ?? this.is_day,
      time: time ?? this.time,
    );
  }
}
