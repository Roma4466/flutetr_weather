import 'package:bloc/bloc.dart';
import 'package:db/db.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weather/weather_pages/weather/models/models.dart';
import 'package:weather_repository/weather_repository.dart';

import '../models/history_view_filter.dart';

part 'history_event.dart';

part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc({required WeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository,
        super(HistoryState()) {
    on<HistorySubscriptionRequested>((event, emit) async {
      emit(state.copyWith(status: () => HistoryStatus.loading));

      await emit.forEach<List<WeatherFromDB>>(
        _weatherRepository.getWeathers(),
        onData: (weathers) => state.copyWith(
          status: () => HistoryStatus.success,
          weathers: () =>
              weathers.map((weather) => Weather.fromDb(weather)).toList(),
        ),
        onError: (_, __) => state.copyWith(
          status: () => HistoryStatus.failure,
        ),
      );
    });
    on<HistoryWeatherDeleted>(
      (event, emit) {
        emit(state.copyWith(
          lastDeletedWeather: () => event.weather,
        ));
        _weatherRepository.deleteWeather(event.weather.id);
      },
    );
    on<WeatherUndoDeletionRequested>(
      (event, emit) async {
        assert(
          state.lastDeletedWeather != null,
          'Last deleted todo can not be null.',
        );
        final weather = state.lastDeletedWeather!;
        emit(state.copyWith(lastDeletedWeather: () => null));
        await _weatherRepository.undoDeletion(weather.id);
      },
    );
    on<HistoryFilterChanged>(
      (event, emit) {
        emit(state.copyWith(filter: () => event.filter));
      },
    );
    on<HistoryDeleteAll>(
      (event, emit) async {
        await _weatherRepository.deleteAll();
      },
    );
  }

  final WeatherRepository _weatherRepository;
}
