import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger_app/core/services/firebase_service.dart';
import 'package:meta/meta.dart';

part 'create_name_event.dart';
part 'create_name_state.dart';

@injectable
class CreateNameBloc extends Bloc<CreateNameBlocEvent, CreateNameState> {
  CreateNameBloc(this._firebaseService) : super(const CreateNameState()) {
    on<CreateNameBlocEvent>((event, emit) {});
    on<CreatYourNameEvent>(
        (event, emit) => handleCreatYourNameEvent(event, emit));
    on<CreateYourEmailEvent>(
      (event, emit) => handleCreatYourEmailEvent(event, emit),
    );
    on<CreateYourPasswordEvent>(
      (event, emit) => handleCreatYourPasswordEvent(event, emit),
    );
    on<RegisterEvent>((event, emit) => handleRegisterEvent(event, emit));
  }
  final FirebaseService? _firebaseService;

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

  handleRegisterEvent(
      RegisterEvent event, Emitter<CreateNameState> emit) async {
    bool result = await _firebaseService!.registerUser(
        name: state.createName!,
        email: state.createEmail!,
        password: state.createPassword!);
    final newState = state.coppyWith(registerResult: result);
    emit(newState);
  }
}
