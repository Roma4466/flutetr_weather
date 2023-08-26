import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_repository/weather_repository.dart';

import '../theme/cubit/theme_cubit.dart';
import '../weather_pages/weather/models/weather.dart';

extension WeatherToColor on Weather {
  Color get toColor {
    switch (condition) {
      case WeatherCondition.clear:
        return Colors.orangeAccent;
      case WeatherCondition.snowy:
        return Colors.lightBlueAccent;
      case WeatherCondition.cloudy:
        return Colors.blueGrey;
      case WeatherCondition.rainy:
        return Colors.indigoAccent;
      case WeatherCondition.thunder:
        return Colors.indigo;
      case WeatherCondition.drizzle:
        return Colors.lightBlue;
      case WeatherCondition.unknown:
        return ThemeCubit.defaultColor;
    }
  }
}
