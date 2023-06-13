part of 'search_page_bloc.dart';

@immutable
abstract class SearchPageEvent {}

class ResultSearchEvent extends SearchPageEvent {
  final String resultSearch;

  ResultSearchEvent({required this.resultSearch});
}
