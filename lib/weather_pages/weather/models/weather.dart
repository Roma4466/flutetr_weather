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
      condition: weather.mainDescription.toCondition,
      lastUpdated: DateTime.now(),
      location: weather.city,
      temperature: Temperature(
        value: weather.temperature,
        minValue: weather.minTemp,
        maxValue: weather.maxTemp,
        feelsLike: weather.feelsLike,
      ),
      mainDescription: weather.mainDescription,
      description: weather.description,
      pressure: weather.pressure,
      humidity: weather.humidity,
      visibility: weather.visibility,
      windSpeed: weather.windSpeed,
      sunrise: weather.sunrise,
      sunset: weather.sunset,
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

extension on String {
  WeatherCondition get toCondition {
    switch (this) {
      case 'Clear':
        return WeatherCondition.clear;
      case 'Clouds':
        return WeatherCondition.cloudy;
      case 'Rainy':
        return WeatherCondition.rainy;
      case 'Snowy':
        return WeatherCondition.snowy;
      default:
        return WeatherCondition.unknown;
    }
  }
}
