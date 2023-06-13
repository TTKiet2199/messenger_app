part of 'create_name_bloc.dart';

@immutable
class CreateNameState {
  final String? createName;

  const CreateNameState({this.createName});

  CreateNameState coppyWith({String? createName}) =>
      CreateNameState(createName: createName ?? this.createName);
}
