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
    on<HistorySubscriptionRequested>((event, emit) {
      // TODO: implement event handler
    });
  }

  final WeatherRepository _weatherRepository;
}
