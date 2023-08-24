import 'package:floor/floor.dart';
import 'package:uuid/uuid.dart';

import 'datetime_conventer.dart';

@TypeConverters([DateTimeConverter])
@entity
class WeatherFromDB {
  @PrimaryKey(autoGenerate: true)
  final String id;
  final String city;
  final double temperature;
  final double windSpeed;
  final String mainDescription;
  final String description;
  final int pressure;
  final int humidity;
  final int visibility;
  final double minTemp;
  final double maxTemp;
  final double feelsLike;
  final DateTime sunrise;
  final DateTime sunset;

  WeatherFromDB({
    required this.city,
    required this.temperature,
    required this.windSpeed,
    required this.mainDescription,
    required this.description,
    required this.pressure,
    required this.humidity,
    required this.visibility,
    required this.minTemp,
    required this.maxTemp,
    required this.feelsLike,
    required this.sunrise,
    required this.sunset,
  }) : id = const Uuid().v4();

  @override
  String toString() {
    return 'WeatherFromDB{city: $city, temperature: $temperature, windSpeed: $windSpeed, '
        'mainDescription: $mainDescription, description: $description, pressure: $pressure, '
        'humidity: $humidity, visibility: $visibility, minTemp: $minTemp, maxTemp: $maxTemp, '
        'feelsLike: $feelsLike, sunrise: $sunrise, sunset: $sunset}';
  }

  WeatherFromDB copyWith({
    String? city,
    double? temperature,
    double? windSpeed,
    String? mainDescription,
    String? description,
    int? pressure,
    int? humidity,
    int? visibility,
    double? minTemp,
    double? maxTemp,
    double? feelsLike,
    DateTime? sunrise,
    DateTime? sunset,
  }) {
    return WeatherFromDB(
      city: city ?? this.city,
      temperature: temperature ?? this.temperature,
      windSpeed: windSpeed ?? this.windSpeed,
      mainDescription: mainDescription ?? this.mainDescription,
      description: description ?? this.description,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      visibility: visibility ?? this.visibility,
      minTemp: minTemp ?? this.minTemp,
      maxTemp: maxTemp ?? this.maxTemp,
      feelsLike: feelsLike ?? this.feelsLike,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
    );
  }
}
