import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/weather_pages/weather/weather.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage._();

  static Route<void> route(WeatherCubit weatherCubit) {
    return MaterialPageRoute<void>(
      builder: (_) => BlocProvider.value(
        value: weatherCubit,
        child: const SettingsPage._(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: <Widget>[
          BlocBuilder<WeatherCubit, WeatherState>(
            buildWhen: (previous, current) =>
                previous.temperatureUnits != current.temperatureUnits,
            builder: (context, state) {
              return ListTile(
                title: const Text('Temperature Units'),
                isThreeLine: true,
                subtitle: const Text(
                  'Choose temperature units: Celsius or Fahrenheit.',
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Celsius'),
                    Switch(
                      value: state.temperatureUnits.isCelsius,
                      onChanged: (_) =>
                          context.read<WeatherCubit>().toggleUnits(),
                      activeColor: Colors.blue,
                      // Set your desired active color here
                      inactiveTrackColor: Colors.blue,
                    ),
                    Text('Fahrenheit'),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
