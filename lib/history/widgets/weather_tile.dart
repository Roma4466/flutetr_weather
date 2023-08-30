import 'package:flutter/material.dart';
import 'package:flutter_weather/extensions/extensions.dart';
import 'package:intl/intl.dart';

import '../../weather_pages/weather/weather.dart';

class WeatherTile extends StatelessWidget {
  final Weather weather;
  final Color color;
  final VoidCallback onDelete;
  final Animation<double> animation;
  final bool removing;

  WeatherTile({
    required this.weather,
    required this.onDelete,
    required this.animation,
    this.removing = true,
  }) : color = weather.toColor;

  void selectCategory(BuildContext context) {
    Navigator.of(context).push<void>(WeatherPage.route(context, weather));
  }

  @override
  Widget build(BuildContext context) {
    final visibilityInPercents = weather.visibility / 10000;
    return InkWell(
      onTap: () => selectCategory(context),
      onLongPress: () => onDelete(),
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
        child: ScaleTransition(
          scale: CurvedAnimation(
              parent: animation,
              curve: removing ? Curves.easeInOut : Curves.bounceOut),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: SizedBox(
              height: 80.0,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      weather.location,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    WeatherIcon(
                      iconUrl: weather.iconUrl,
                      iconSize: 24.0,
                    ),
                    Text(
                      DateFormat('dd/MM HH:mm').format(weather.lastUpdated),
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
