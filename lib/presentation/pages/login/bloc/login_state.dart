part of 'login_bloc.dart';

@immutable
class LoginState {
  final String? email;
  final String? password;

  const LoginState({this.email, this.password});
  LoginState coppyWith({String? email, String? password}) => LoginState(
      email: email ?? this.email, password: password ?? this.password);
}
