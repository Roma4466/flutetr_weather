import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/extensions/extensions.dart';
import 'package:flutter_weather/history/bloc/history_bloc.dart';
import 'package:flutter_weather/weather_pages/weather/view/view.dart';

import '../../weather_pages/weather/models/weather.dart';

class WeatherTile extends StatelessWidget {
  final Weather weather;
  final Color color;

  WeatherTile(this.weather) : color = weather.toColor;

  void selectCategory(BuildContext context) {
    Navigator.of(context).push<void>(WeatherPage.route(context, weather));
  }

  @override
  Widget build(BuildContext context) {
    final visibilityInPercents = weather.visibility / 10000;
    return InkWell(
      onTap: () => selectCategory(context),
      onLongPress: () =>
          context.read<HistoryBloc>().add(HistoryWeatherDeleted(weather)),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.blurred(visibilityInPercents),
              color.brighten().blurred(visibilityInPercents),
              color.brighten(33).blurred(visibilityInPercents),
              color.brighten(33).blurred(visibilityInPercents),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          weather.location,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
