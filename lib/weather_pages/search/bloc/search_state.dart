part of 'search_bloc.dart';

@immutable
class SearchState extends Equatable {
  final List<String> suggestions;

  SearchState(this.suggestions);

  @override
  List<Object?> get props => [suggestions];
}
