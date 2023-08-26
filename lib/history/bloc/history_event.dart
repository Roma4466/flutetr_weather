part of 'history_bloc.dart';

sealed class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object> get props => [];
}

final class HistorySubscriptionRequested extends HistoryEvent {
  const HistorySubscriptionRequested();
}

final class HistoryWeatherDeleted extends HistoryEvent {
  const HistoryWeatherDeleted(this.weather);

  final Weather weather;

  @override
  List<Object> get props => [weather];
}

final class WeatherUndoDeletionRequested extends HistoryEvent {
  const WeatherUndoDeletionRequested();
}

class HistoryFilterChanged extends HistoryEvent {
  const HistoryFilterChanged(this.filter);

  final HistoryViewFilter filter;

  @override
  List<Object> get props => [filter];
}

final class HistoryDeleteAll extends HistoryEvent {
  const HistoryDeleteAll();
}
