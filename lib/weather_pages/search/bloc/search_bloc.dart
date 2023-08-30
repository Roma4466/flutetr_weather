import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather_repository/weather_repository.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({
    required WeatherRepository weatherRepository,
  })  : _weatherRepository = weatherRepository,
        super(SearchState([])) {
    on<SuggestionsRequested>((event, emit) async {
      final suggestions = await _weatherRepository.getCitiesList();
      emit(SearchState(suggestions));
    });
  }

  final WeatherRepository _weatherRepository;
}
