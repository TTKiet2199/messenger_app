import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginBlocEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginBlocEvent>((event, emit) {});
    on<EnterYourEmailEvent>(
        (event, emit) => handleEnterYourEmailEvent(event, emit));
    on<EnterYourPasswordEvent>(
        (event, emit) => handleEnterYourPasswordEvent(event, emit));
  }

  handleEnterYourEmailEvent(
      EnterYourEmailEvent event, Emitter<LoginState> emit) {
    final enterEmail = state.coppyWith(email: event.enterEmail);
    emit(enterEmail);
  }

  handleEnterYourPasswordEvent(
      EnterYourPasswordEvent event, Emitter<LoginState> emit) {
    final enterPassword = state.coppyWith(password: event.enterPassword);
    emit(enterPassword);
  }
}
