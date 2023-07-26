part of 'login_bloc.dart';

@immutable
class LoginState {
  final String? email;
  final String? password;
  final bool? loginResult;

  const LoginState({this.loginResult, this.email, this.password});
  LoginState coppyWith({
    String? email,
    String? password,
    bool? loginResult,
  }) =>
      LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        loginResult: loginResult?? this.loginResult,
      );
}
