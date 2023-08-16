part of 'select_contact_bloc.dart';

@immutable
class SelectContactState {
  final List<UserModel>? listCallContact;

  const SelectContactState({this.listCallContact});
  SelectContactState coppyWith({
    List<UserModel>? listCallContact,
  }) =>
      SelectContactState(
        listCallContact: listCallContact ?? this.listCallContact,
      );
}
