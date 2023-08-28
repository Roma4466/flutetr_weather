import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/theme/theme.dart';
import 'package:flutter_weather/weather_pages/search/search.dart';
import 'package:flutter_weather/weather_pages/weather/weather.dart';
import 'package:weather_repository/weather_repository.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key, this.weather});

  final Weather? weather;

  //this route is for history page only
  //so i can reuse this page
  static Route<String> route(BuildContext context, Weather weather) {
    context.read<ThemeCubit>().updateTheme(weather);
    return MaterialPageRoute(
        builder: (_) => WeatherPage(
              weather: weather,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(context.read<WeatherRepository>()),
      child: WeatherView(weather: weather),
    );
  }
}

class WeatherView extends StatefulWidget {
  const WeatherView({super.key, this.weather});

  final Weather? weather;

  @override
  State<WeatherView> createState() => _WeatherViewState(weather: weather);
}

class _WeatherViewState extends State<WeatherView> {
  _WeatherViewState({this.weather});

  final Weather? weather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Weather'),
      ),
      body: Center(
        child: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (context, state) {
            if (state.status.isSuccess) {
              context.read<ThemeCubit>().updateTheme(state.weather);
            }
          },
          builder: (context, state) {
            switch (state.status) {
              case WeatherStatus.initial:
                if (weather == null) {
                  return const WeatherEmpty();
                } else {
                  return WeatherPopulated(
                    weather: weather!,
                    units: state.temperatureUnits,
                    onRefresh: () {
                      return context.read<WeatherCubit>().refreshWeather();
                    },
                  );
                }
              case WeatherStatus.loading:
                return const WeatherLoading();
              case WeatherStatus.success:
                return WeatherPopulated(
                  weather: state.weather,
                  units: state.temperatureUnits,
                  onRefresh: () {
                    return context.read<WeatherCubit>().refreshWeather();
                  },
                );
              case WeatherStatus.failure:
                return const WeatherError();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search, semanticLabel: 'Search'),
        onPressed: () async {
          final city = await Navigator.of(context).push(SearchPage.route());

          if (!mounted) return;
          await context.read<WeatherCubit>().fetchWeather(city);
        },
      ),
    );
  }
}
