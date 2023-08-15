part of 'history_bloc.dart';

enum HistoryStatus { initial, loading, success, failure }

final class TodosOverviewState extends Equatable {
  const TodosOverviewState({
    this.status = HistoryStatus.initial,
    this.todos = const [],
    this.filter = HistoryViewFilter.byDate,
    this.lastDeletedItem,
  });

  final HistoryStatus status;
  final List<Todo> todos;
  final HistoryViewFilter filter;
  final Weather? lastDeletedItem;

  Iterable<Weather> get filteredTodos => filter.applyAll(todos);

  TodosOverviewState copyWith({
    TodosOverviewStatus Function()? status,
    List<Todo> Function()? todos,
    TodosViewFilter Function()? filter,
    Todo? Function()? lastDeletedTodo,
  }) {
    return TodosOverviewState(
      status: status != null ? status() : this.status,
      todos: todos != null ? todos() : this.todos,
      filter: filter != null ? filter() : this.filter,
      lastDeletedTodo:
      lastDeletedTodo != null ? lastDeletedTodo() : this.lastDeletedTodo,
    );
  }

  @override
  List<Object?> get props => [
    status,
    todos,
    filter,
    lastDeletedTodo,
  ];
}
