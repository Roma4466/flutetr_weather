import 'package:json_annotation/json_annotation.dart';

part 'weather_entity.g.dart';

@JsonSerializable()
class WeatherEntity {
  final double latitude;
  final double longitude;
  final double generationtime_ms;
  final int utc_offset_seconds;
  final String timezone;
  final String timezone_abbreviation;
  final double elevation;
  final CurrentWeather current_weather;

  WeatherEntity({
    required this.latitude,
    required this.longitude,
    required this.generationtime_ms,
    required this.utc_offset_seconds,
    required this.timezone,
    required this.timezone_abbreviation,
    required this.elevation,
    required this.current_weather,
  });

  factory WeatherEntity.fromJson(Map<String, dynamic> json) =>
      _$WeatherEntityFromJson(json);

  @override
  String toString() {
    return 'WeatherEntity{latitude: $latitude, longitude: $longitude, '
        'generationtime_ms: $generationtime_ms, utc_offset_seconds: $utc_offset_seconds, '
        'timezone: $timezone, timezone_abbreviation: $timezone_abbreviation, '
        'elevation: $elevation, current_weather: $current_weather}';
  }
}

@JsonSerializable()
class CurrentWeather {
  final double temperature;
  final double windspeed;
  final int winddirection;
  final int weathercode;
  final int is_day;
  final String time;

  CurrentWeather({
    required this.temperature,
    required this.windspeed,
    required this.winddirection,
    required this.weathercode,
    required this.is_day,
    required this.time,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);

  @override
  String toString() {
    return 'CurrentWeather{temperature: $temperature, windspeed: $windspeed, '
        'winddirection: $winddirection, weathercode: $weathercode, '
        'is_day: $is_day, time: $time}';
  }
}
