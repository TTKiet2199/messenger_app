part of 'login_bloc.dart';

@immutable
abstract class LoginBlocEvent {}

class EnterYourEmailEvent extends LoginBlocEvent {
  final String enterEmail;

  EnterYourEmailEvent({required this.enterEmail});
}

class EnterYourPasswordEvent extends LoginBlocEvent {
  final String enterPassword;

  EnterYourPasswordEvent({required this.enterPassword});
}
