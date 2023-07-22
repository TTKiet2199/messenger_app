part of 'create_name_bloc.dart';

@immutable
class CreateNameState {
  final String? createName;
  final String? createEmail;
  final String? createPassword;
  const CreateNameState(
      {this.createEmail, this.createPassword, this.createName});

  CreateNameState coppyWith(
          {String? createName, String? createEmail, String? createPassword}) =>
      CreateNameState(
          createName: createName ?? this.createName,
          createEmail: createEmail ?? this.createEmail,
          createPassword: createPassword ?? this.createPassword);
}
