// part of 'history_bloc.dart';
//
// sealed class HistoryEvent extends Equatable {
//   const HistoryEvent();
//
//   @override
//   List<Object> get props => [];
// }
//
// final class HistorySubscriptionRequested extends HistoryEvent {
//   const HistorySubscriptionRequested();
// }
//
// final class WeatherItemDeleted extends HistoryEvent {
//   const WeatherItemDeleted(this.weather);
//
//   final Weather weather;
//
//   @override
//   List<Object> get props => [weather];
// }
//
// final class TodosOverviewUndoDeletionRequested extends HistoryEvent {
//   const TodosOverviewUndoDeletionRequested();
// }
//
// class HistoryFilterChanged extends HistoryEvent {
//   const HistoryFilterChanged(this.filter);
//
//   final HistoryViewFilter filter;
//
//   @override
//   List<Object> get props => [filter];
// }
//
// final class DeleteAll extends HistoryEvent {
//   const DeleteAll();
// }
