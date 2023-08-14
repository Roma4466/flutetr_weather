import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../weather_pages/weather/weather.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
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
                  'Choose temperature units',
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
