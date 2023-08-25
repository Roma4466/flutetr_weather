part of 'history_bloc.dart';

enum HistoryStatus { initial, loading, success, failure }

final class HistoryState extends Equatable {
  const HistoryState({
    this.status = HistoryStatus.initial,
    this.weathers = const [],
    this.filter = HistoryViewFilter.byDate,
    this.lastDeletedWeather,
  });

  final HistoryStatus status;
  final List<Weather> weathers;
  final HistoryViewFilter filter;
  final Weather? lastDeletedWeather;

  Iterable<Weather> get filteredTodos => filter.apply(weathers);

  HistoryState copyWith({
    List<Weather> Function()? weathers,
    HistoryViewFilter Function()? filter,
    Weather? Function()? lastDeletedWeather,
  }) {
    return HistoryState(
      weathers: weathers != null ? weathers() : this.weathers,
      filter: filter != null ? filter() : this.filter,
      lastDeletedWeather: lastDeletedWeather != null
          ? lastDeletedWeather()
          : this.lastDeletedWeather,
    );
  }

  @override
  List<Object?> get props => [
        status,
        weathers,
        filter,
        lastDeletedWeather,
      ];
}
