part of 'create_name_bloc.dart';

@immutable
abstract class CreateNameBlocEvent {}

class CreatYourNameEvent extends CreateNameBlocEvent {
  final String createYourName;

  CreatYourNameEvent({required this.createYourName});
}

class CreateYourEmailEvent extends CreateNameBlocEvent {
  final String createYouremail;

  CreateYourEmailEvent({required this.createYouremail});
}

class CreateYourPasswordEvent extends CreateNameBlocEvent {
  final String createYourPassword;

  CreateYourPasswordEvent({required this.createYourPassword});
}
class RegisterEvent extends CreateNameBlocEvent{}