import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/history/bloc/history_bloc.dart';
import 'package:flutter_weather/history/view/history_view.dart';
import 'package:weather_repository/weather_repository.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryBloc(
        weatherRepository: context.read<WeatherRepository>(),
      )..add(const HistorySubscriptionRequested()),
      child: const HistoryView(),
    );
  }
}