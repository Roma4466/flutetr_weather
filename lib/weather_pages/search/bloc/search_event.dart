part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SuggestionsRequested implements SearchEvent{
  const SuggestionsRequested();
}
