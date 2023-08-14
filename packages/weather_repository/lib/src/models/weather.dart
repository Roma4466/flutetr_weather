import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

enum WeatherCondition {
  clear,
  rainy,
  cloudy,
  snowy,
  unknown;

  String get toEmoji {
    switch (this) {
      case WeatherCondition.clear:
        return '☀️';
      case WeatherCondition.rainy:
        return '🌧️';
      case WeatherCondition.cloudy:
        return '☁️';
      case WeatherCondition.snowy:
        return '🌨️';
      case WeatherCondition.unknown:
        return '❓';
    }
  }
}

@JsonSerializable()
class WeatherForRepository extends Equatable {
  const WeatherForRepository({
    required this.location,
    required this.temperature,
    required this.condition,
  });

  factory WeatherForRepository.fromJson(Map<String, dynamic> json) =>
      _$WeatherForRepositoryFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherForRepositoryToJson(this);

  final String location;
  final double temperature;
  final WeatherCondition condition;

  @override
  List<Object> get props => [location, temperature, condition];
}
