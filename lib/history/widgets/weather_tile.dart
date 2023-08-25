import 'package:flutter/material.dart';
import 'package:flutter_weather/weather_pages/weather/view/view.dart';

import '../../weather_pages/weather/models/weather.dart';

class WeatherTile extends StatelessWidget {
  final Weather weather;
  final Color color;

  WeatherTile(this.weather, this.color);

  void selectCategory(BuildContext context) {
    Navigator
        .of(context)
        .push<void>(WeatherPopulated.route(
        weather: weather, units: units, onRefresh: onRefresh);
    }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme
          .of(context)
          .primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          weather.location,
          style: Theme
              .of(context)
              .textTheme
              .titleLarge,
        ),
      ),
    );
  }
}
