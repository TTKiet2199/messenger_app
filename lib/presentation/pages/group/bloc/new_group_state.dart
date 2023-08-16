part of 'new_group_bloc.dart';

@immutable
class NewGroupState {
  final List<UserModel>? listMember;

  const NewGroupState({this.listMember});
  NewGroupState coppyWith({
    List<UserModel>? listMember,
  }) =>
      NewGroupState(
        listMember: listMember ?? this.listMember,
      );
}
