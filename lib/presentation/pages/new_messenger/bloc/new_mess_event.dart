part of 'new_mess_bloc.dart';

@immutable
abstract class NewMessEvent {}

class GetUserEvent extends NewMessEvent {}

class UploadToTalkEvent extends NewMessEvent {
  final String name;
  final String image;
  final String id;

  UploadToTalkEvent({required this.id, required this.name, required this.image});
}
