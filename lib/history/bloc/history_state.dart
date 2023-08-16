part of 'history_bloc.dart';

enum HistoryStatus { initial, loading, success, failure }

final class HistoryState extends Equatable {
  const HistoryState({
    this.status = HistoryStatus.initial,
    this.weathers = const [],
    this.filter = HistoryViewFilter.byDate,
    this.lastDeletedItem,
  });

  final HistoryStatus status;
  final List<Weather> weathers;
  final HistoryViewFilter filter;
  final Weather? lastDeletedItem;

  Iterable<Weather> get filteredWeathers => filter.apply(weathers);

  HistoryState copyWith({
    HistoryStatus? status,
    List<Weather>? weathers,
    HistoryViewFilter? filter,
    Weather Function()? lastDeletedTodo,
  }) {
    return HistoryState(
      status: status != null ? status : this.status,
      weathers: weathers != null ? weathers : this.weathers,
      filter: filter != null ? filter : this.filter,
      lastDeletedItem:
          lastDeletedTodo != null ? lastDeletedTodo() : this.lastDeletedItem,
    );
  }

  @override
  List<Object?> get props => [
        status,
        weathers,
        filter,
        lastDeletedItem,
      ];
}
