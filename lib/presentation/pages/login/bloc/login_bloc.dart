import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/services/firebase_service.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginBlocEvent, LoginState> {
  LoginBloc(this._firebaseService) : super(const LoginState()) {
    on<LoginBlocEvent>((event, emit) {});
    on<EnterYourEmailEvent>(
        (event, emit) => handleEnterYourEmailEvent(event, emit));
    on<EnterYourPasswordEvent>(
        (event, emit) => handleEnterYourPasswordEvent(event, emit));
    on<LoginEvent>((event, emit) => handleLoginEvent(event, emit));
  }

  final FirebaseService? _firebaseService;

  handleEnterYourEmailEvent(
      EnterYourEmailEvent event, Emitter<LoginState> emit) {
    //cap nhat state moi co email = email cua event

    final newState = state.coppyWith(email: event.enterEmail);
    //emit: xuat dau ra = newState
    emit(newState);
  }

  handleEnterYourPasswordEvent(
      EnterYourPasswordEvent event, Emitter<LoginState> emit) {
    final newState = state.coppyWith(password: event.enterPassword);
    emit(newState);
  }

  handleLoginEvent(LoginEvent event, Emitter<LoginState> emit) async {
    final bool result = await _firebaseService!
        .loginUsers(email: state.email ?? 'kiet1@gmail.com', password: state.password ?? '1234567');
    final newState = state.coppyWith(loginResult: result);
    emit(newState);
  }
}
