import 'package:bloc/bloc.dart';
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
      emit(state.copyWith(status: HistoryStatus.loading));

      await for (final weathers in _weatherRepository.getWeathers()) {
        // Convert each value and emit it
        final convertedWeathers =
            weathers.map((weather) => Weather.fromDb(weather)).toList();
        emit(state.copyWith(
          status: HistoryStatus.success,
          weathers: convertedWeathers,
        ));
      }
    });
    on<WeatherItemDeleted>(
      (event, emit) async {
        emit(state.copyWith(lastDeletedTodo: () => event.weather));
        await _weatherRepository.delete(event.weather.id);
      },
    );
    on<UndoDeletionRequested>(
      (event, emit) async {
        assert(
          state.lastDeletedItem != null,
          'Last deleted todo can not be null.',
        );
        emit(state.copyWith(lastDeletedTodo: null));
        await _weatherRepository.undoDelete();
      },
    );
    on<DeleteAll>(
      (event, emit) async {
        await _weatherRepository.deleteAll();
      },
    );
    on<HistoryFilterChanged>(
      (event, emit) async {
        emit(state.copyWith(filter: event.filter));
      },
    );
  }

  final WeatherRepository _weatherRepository;
}
