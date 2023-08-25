import 'package:flutter/material.dart';
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
  _WeatherBackground(Weather weather)
      : visibility = weather.visibility / 10000,
        weatherCondition = weather.condition,
        windSpeed = weather.windSpeed;
  final double visibility;
  final WeatherCondition weatherCondition;
  final double windSpeed;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return WrapperScene(
      children: [
        if (weatherCondition == WeatherCondition.clear) SunWidget(),
        if (weatherCondition == WeatherCondition.cloudy) CloudWidget(),
        if (weatherCondition == WeatherCondition.rainy) RainWidget(),
        if (weatherCondition == WeatherCondition.snowy) SnowWidget(),
        if (weatherCondition == WeatherCondition.thunder) ThunderWidget(),
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
}

extension on Color {
  Color blurred([double percent = 0.1]) {
    final p = 0.5 + percent / 2;
    return Color.fromARGB(
      alpha,
      (red * p).round(),
      (green * p).round(),
      (blue * p).round(),
    );
  }
}

String formattedTemperature(double value, TemperatureUnits units) {
  double formattedValue =
      units.isCelsius ? value.toCelsius() : value.toFahrenheit();
  String formattedValueString = formattedValue.toStringAsFixed(0);
  return '$formattedValueString°${units.isCelsius ? 'C' : 'F'}';
}

extension on double {
  double toCelsius() {
    return this - 273.16;
  }

  double toFahrenheit() {
    return (this - 273.16) * 9 / 5 + 32;
  }
}
