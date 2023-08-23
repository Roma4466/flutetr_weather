import 'package:db/db/db.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_repository/weather_repository.dart';

import 'temperature.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather extends Equatable {
  const Weather({
    required this.condition,
    required this.lastUpdated,
    required this.location,
    required this.temperature,
    required this.mainDescription,
    required this.description,
    required this.pressure,
    required this.humidity,
    required this.visibility,
    required this.windSpeed,
    required this.sunrise,
    required this.sunset,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  factory Weather.fromDb(WeatherFromDB weather) {
    return Weather(
      condition: weather.weatherCode.toCondition,
      lastUpdated: DateTime.now(),
      location: weather.city,
      temperature: Temperature(
          value: weather.temperature, minValue: 0, maxValue: 0, feelsLike: 0),
      mainDescription: '',
      // Set the appropriate values
      description: '',
      // Set the appropriate values
      pressure: 0,
      // Set the appropriate values
      humidity: 0,
      // Set the appropriate values
      visibility: 0,
      // Set the appropriate values
      windSpeed: 0,
      // Set the appropriate values
      sunrise: DateTime.now(),
      // Set the appropriate values
      sunset: DateTime.now(), // Set the appropriate values
    );
  }

  static final empty = Weather(
    condition: WeatherCondition.unknown,
    lastUpdated: DateTime(0),
    temperature: const Temperature(
      value: 0,
      minValue: 0,
      maxValue: 0,
      feelsLike: 0,
    ),
    location: '--',
    mainDescription: '',
    description: '',
    pressure: 0,
    humidity: 0,
    visibility: 0,
    windSpeed: 0,
    sunrise: DateTime.now(),
    sunset: DateTime.now(),
  );

  final WeatherCondition condition;
  final DateTime lastUpdated;
  final String location;
  final Temperature temperature;
  final String mainDescription;
  final String description;
  final int pressure;
  final int humidity;
  final int visibility;
  final double windSpeed;
  final DateTime sunrise;
  final DateTime sunset;

  @override
  List<Object> get props => [
        condition,
        lastUpdated,
        location,
        temperature,
        mainDescription,
        description,
        pressure,
        humidity,
        visibility,
        windSpeed,
        sunrise,
        sunset,
      ];

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  Weather copyWith({
    WeatherCondition? condition,
    DateTime? lastUpdated,
    String? location,
    Temperature? temperature,
    String? mainDescription,
    String? description,
    int? pressure,
    int? humidity,
    int? visibility,
    double? windSpeed,
    DateTime? sunrise,
    DateTime? sunset,
  }) {
    return Weather(
      condition: condition ?? this.condition,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      location: location ?? this.location,
      temperature: temperature ?? this.temperature,
      mainDescription: mainDescription ?? this.mainDescription,
      description: description ?? this.description,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      visibility: visibility ?? this.visibility,
      windSpeed: windSpeed ?? this.windSpeed,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
    );
  }
}

extension on int {
  WeatherCondition get toCondition {
    switch (this) {
      case 0:
        return WeatherCondition.clear;
      case 1:
      case 2:
      case 3:
      case 45:
      case 48:
        return WeatherCondition.cloudy;
      case 51:
      case 53:
      case 55:
      case 56:
      case 57:
      case 61:
      case 63:
      case 65:
      case 66:
      case 67:
      case 80:
      case 81:
      case 82:
      case 95:
      case 96:
      case 99:
        return WeatherCondition.rainy;
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return WeatherCondition.snowy;
      default:
        return WeatherCondition.unknown;
    }
  }
}
