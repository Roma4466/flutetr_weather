import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/maps/bloc/maps_cubit.dart';
import 'package:flutter_weather/maps/maps.dart';
import 'package:weather_repository/weather_repository.dart';

import '../weather_pages/weather/weather.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const MapsPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapsCubit(context.read<WeatherRepository>()),
      child: const MapsView(),
    );
  }
}
