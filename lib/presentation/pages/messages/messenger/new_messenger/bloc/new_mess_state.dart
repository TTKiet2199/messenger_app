part of 'new_mess_bloc.dart';

@immutable
class NewMessengerState {
  final List? listUsers;

  NewMessengerState({this.listUsers});
  NewMessengerState coppyWith({List? listUsers}) =>
      NewMessengerState(listUsers: listUsers ?? this.listUsers);
}
