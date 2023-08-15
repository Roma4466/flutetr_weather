import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

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