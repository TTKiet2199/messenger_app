part of 'search_page_bloc.dart';

@immutable
class SearchPageState {
  final String? search;

  const SearchPageState({this.search});
  SearchPageState coppyWith({String? search}) =>
      SearchPageState(search: search ?? this.search);
}
