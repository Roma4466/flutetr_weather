import 'package:flutter/material.dart';
import 'package:flutter_weather/extensions/extensions.dart';
import 'package:flutter_weather/weather_pages/weather/weather.dart';
import 'package:weather_animation/weather_animation.dart';
import 'package:weather_repository/weather_repository.dart';

class WeatherPopulated extends StatelessWidget {
  const WeatherPopulated({
    required this.weather,
    required this.units,
    required this.onRefresh,
    super.key,
  });

  final Weather weather;
  final TemperatureUnits units;
  final ValueGetter<Future<void>> onRefresh;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        _WeatherBackground(weather),
        RefreshIndicator(
          onRefresh: onRefresh,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            clipBehavior: Clip.none,
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 300),
                  if (!weather.condition.ifThereIsAnimateForIt())
                    WeatherIcon(
                      iconUrl: weather.iconUrl,
                      iconSize: 75.0,
                    ),
                  Text(
                    weather.location,
                    style: theme.textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  Text(
                    weather.description,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Current temperature:',
                            style: theme.textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            formattedTemperature(
                                weather.temperature.value, units),
                            style: theme.textTheme.displaySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Feels like:',
                            style: theme.textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            formattedTemperature(
                                weather.temperature.feelsLike, units),
                            style: theme.textTheme.displaySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    '''Last Updated at ${TimeOfDay.fromDateTime(weather.lastUpdated).format(context)}''',
                  ),
                  Text(
                    'Minimum temperature: ${formattedTemperature(weather.temperature.minValue, units)}',
                  ),
                  Text(
                    'Maximum temperature: ${formattedTemperature(weather.temperature.maxValue, units)}',
                  ),
                  Text(
                    'Visibility: ${(weather.visibility / 1000).toStringAsFixed(1)} km',
                  ),
                  Text(
                    'Wind speed: ${(weather.windSpeed).toStringAsFixed(1)} m/c',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _WeatherBackground extends StatelessWidget {
  _WeatherBackground(this.weather)
      : visibility = weather.visibility / 10000,
        weatherCondition = weather.condition,
        windSpeed = weather.windSpeed;
  final double visibility;
  final WeatherCondition weatherCondition;
  final double windSpeed;
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return WrapperScene(
      children: [
        if (weatherCondition == WeatherCondition.clear) SunWidget(),
        if (weatherCondition == WeatherCondition.cloudy) CloudWidget(),
        if (weatherCondition == WeatherCondition.rainy ||
            weather.description.contains('rain'))
          RainWidget(
            rainConfig: RainConfig(
                areaYStart: 0,
                areaXStart: 0,
                areaXEnd: MediaQuery.of(context).size.width + 100,
                areaYEnd: MediaQuery.of(context).size.height,
                count: getDropletsCount(weather.description)),
          ),
        if (weatherCondition == WeatherCondition.snowy ||
            weather.description.contains('snow'))
          SnowWidget(
            snowConfig: SnowConfig(
              areaYStart: 0,
              areaXStart: 0,
              areaXEnd: MediaQuery.of(context).size.width + 100,
              areaYEnd: MediaQuery.of(context).size.height,
              count: 100,
            ),
          ),
        if (weatherCondition == WeatherCondition.thunder) ThunderWidget(
          thunderConfig: ThunderConfig(
            flashStartMill: 0,
            flashEndMill: 10000,
          ),
        ),
        if (windSpeed > 4)
          WindWidget(
            windConfig: WindConfig(windGap: 60 / windSpeed),
          )
      ],
      colors: [
        color.blurred(visibility),
        Colors.white.blurred(visibility),
      ],
      sizeCanvas: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
    );
  }

  int getDropletsCount(String description) {
    if (description.contains('light') || description.contains('sleet'))
      return 50;
    if (description.contains('moderate') ||
        description.contains('shower') ||
        description.contains('freezing') ||
        description.contains('ragged')) return 100;
    if (description.contains('very heavy')) return 400;
    if (description.contains('heavy')) return 200;
    if (description.contains('extreme')) return 200;
    return 100;
  }
}

String formattedTemperature(double value, TemperatureUnits units) {
  final updatedValue =
      units.isCelsius ? value.toCelsius() : value.toFahrenheit();
  String formattedValueString = value.toStringAsFixed(0);
  return '$formattedValueString°${units.isCelsius ? 'C' : 'F'}';
}
