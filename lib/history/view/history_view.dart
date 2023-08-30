import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/history/bloc/history_bloc.dart';
import 'package:flutter_weather/history/widgets/widgets.dart';

import '../../weather_pages/weather/weather.dart';

class HistoryView extends StatelessWidget {
  HistoryView({super.key});

  final GlobalKey<AnimatedGridState> listKey = GlobalKey<AnimatedGridState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History of requests'),
        actions: [
          const HistoryFilterButton(),
          const HistoryOptionsButton(),
        ],
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<HistoryBloc, HistoryState>(
            listenWhen: (previous, current) =>
                previous.status != current.status,
            listener: (context, state) {
              if (state.status == HistoryStatus.failure) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content:
                          Text('An error occurred while loading weathers.'),
                    ),
                  );
              }
            },
          ),
          BlocListener<HistoryBloc, HistoryState>(
            listenWhen: (previous, current) =>
                previous.lastDeletedWeather != current.lastDeletedWeather &&
                current.lastDeletedWeather != null,
            listener: (context, state) {
              final deletedWeather = state.lastDeletedWeather!;
              final messenger = ScaffoldMessenger.of(context);
              messenger
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content:
                        Text('Weather ${deletedWeather.location} is deleted'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        messenger.hideCurrentSnackBar();
                        context
                            .read<HistoryBloc>()
                            .add(const WeatherUndoDeletionRequested());
                      },
                    ),
                  ),
                );
            },
          ),
        ],
        child: BlocBuilder<HistoryBloc, HistoryState>(
          builder: (context, state) {
            if (state.weathers.isEmpty) {
              if (state.status == HistoryStatus.loading) {
                return const Center(child: CupertinoActivityIndicator());
              } else {
                return const SizedBox();
              }
            }
            return AnimatedGrid(
              key: listKey,
              padding: const EdgeInsets.all(25),
              initialItemCount: state.filteredWeathers.length,
              itemBuilder: (context, index, animation) {
                final weather = state.filteredWeathers[index];
                return WeatherTile(
                  weather: weather,
                  onDelete: () async {
                    listKey.currentState?.removeItem(
                      index,
                      (context, animation) => SizedBox.shrink(),
                      duration: const Duration(milliseconds: 500),
                    );
                    context
                        .read<HistoryBloc>()
                        .add(HistoryWeatherDeleted(weather));
                  },
                  animation: animation,
                );
              },
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
            );
          },
        ),
      ),
    );
  }
}