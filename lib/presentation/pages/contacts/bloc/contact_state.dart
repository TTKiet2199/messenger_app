part of 'contact_bloc.dart';

@immutable
class ContactState {
  final List<UserModel>? listContact;

  const ContactState({this.listContact});
  ContactState coppyWith({
    List<UserModel>? listContact,
  }) =>
      ContactState(
        listContact: listContact ?? this.listContact,
      );
}
