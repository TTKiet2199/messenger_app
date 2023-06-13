part of 'create_name_bloc.dart';

@immutable
abstract class CreateNameBlocEvent {}

class CreatYourNameEvent extends CreateNameBlocEvent{
  final String createYourName;

  CreatYourNameEvent({required this.createYourName});
}
