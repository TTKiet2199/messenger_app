import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_page_event.dart';
part 'search_page_state.dart';

class SearchPageBloc extends Bloc<SearchPageEvent, SearchPageState> {
  SearchPageBloc() : super(const SearchPageState()) {
    on<SearchPageEvent>((event, emit) {});
    on<ResultSearchEvent>(
        (event, emit) => handleResultSearchEvent(event, emit));
  }

  handleResultSearchEvent(
      ResultSearchEvent event, Emitter<SearchPageState> emit) {
    final newState = state.coppyWith(search: event.resultSearch);
    emit(newState);
  }
}
