part of 'profile_bloc.dart';

@immutable
class ProfileState {
  final ProfileModel? mainProfile;

  const ProfileState({this.mainProfile});
  ProfileState coppyWith({
    ProfileModel? mainProfile,
  }) =>
      ProfileState(
        mainProfile: mainProfile ?? this.mainProfile,
      );
}
