
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_name_event.dart';
part 'create_name_state.dart';

class CreateNameBloc extends Bloc<CreateNameBlocEvent, CreateNameState> {
  CreateNameBloc() : super(const CreateNameState()) {
    on<CreateNameBlocEvent>((event, emit) {});
    on<CreatYourNameEvent>(
        (event, emit) => handleCreatYourNameEvent(event, emit));
  }

  handleCreatYourNameEvent(
      CreatYourNameEvent event, Emitter<CreateNameState> emit) {
    final newState = state.coppyWith(createName: event.createYourName);
    emit(newState);
  }
}
