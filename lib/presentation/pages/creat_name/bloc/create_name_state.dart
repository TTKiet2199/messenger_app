part of 'create_name_bloc.dart';

@immutable
class CreateNameState {
  final String? createName;
  final String? createEmail;
  final String? createPassword;
  final bool? registerResult;
  const CreateNameState(
      {this.registerResult,
      this.createEmail,
      this.createPassword,
      this.createName});

  CreateNameState coppyWith({
    String? createName,
    String? createEmail,
    String? createPassword,
    bool? registerResult,
  }) =>
      CreateNameState(
        createName: createName ?? this.createName,
        createEmail: createEmail ?? this.createEmail,
        createPassword: createPassword ?? this.createPassword,
        registerResult: registerResult ?? this.registerResult,
      );
}
