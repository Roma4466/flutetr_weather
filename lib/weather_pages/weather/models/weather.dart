import 'package:db/db/db.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_repository/weather_repository.dart';

import 'temperature.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather extends Equatable {
  const Weather({
    required this.id,
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
    required this.iconUrl,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  factory Weather.fromDb(WeatherFromDB weather) {
    return Weather(
      id: weather.id,
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
      iconUrl: weather.imageUrl,
    );
  }

  static final empty = Weather(
    id: '',
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
    iconUrl: '',
  );

  final String id;
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
  final String iconUrl;

  @override
  List<Object> get props => [
    id,
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
    iconUrl,
  ];

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  Weather copyWith({
    String? id,
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
    String? iconUrl,
  }) {
    return Weather(
      id: id ?? this.id,
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
      iconUrl: iconUrl ?? this.iconUrl,
    );
  }
}
