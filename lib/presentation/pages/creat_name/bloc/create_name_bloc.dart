import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_name_event.dart';
part 'create_name_state.dart';

class CreateNameBloc extends Bloc<CreateNameBlocEvent, CreateNameState> {
  CreateNameBloc() : super(const CreateNameState()) {
    on<CreateNameBlocEvent>((event, emit) {});
    on<CreatYourNameEvent>(
        (event, emit) => handleCreatYourNameEvent(event, emit));
    on<CreateYourEmailEvent>(
      (event, emit) => handleCreatYourEmailEvent(event, emit),
    );
    on<CreateYourPasswordEvent>(
      (event, emit) => handleCreatYourPasswordEvent(event, emit),
    );
  }

  handleCreatYourNameEvent(
      CreatYourNameEvent event, Emitter<CreateNameState> emit) {
    final newName = state.coppyWith(createName: event.createYourName);
    emit(newName);
  }

  handleCreatYourEmailEvent(
      CreateYourEmailEvent event, Emitter<CreateNameState> emit) {
    final newEmail = state.coppyWith(createEmail: event.createYouremail);
    emit(newEmail);
  }

  handleCreatYourPasswordEvent(
      CreateYourPasswordEvent event, Emitter<CreateNameState> emit) {
    final newPassword =
        state.coppyWith(createPassword: event.createYourPassword);
    emit(newPassword);
  }
}
