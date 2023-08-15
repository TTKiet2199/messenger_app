import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger_app/core/services/firebase_service.dart';
import 'package:messenger_app/data/models/profile_model.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this.firebaseService) : super(const ProfileState()) {
    on<ProfileEvent>((event, emit) {});
    on<GetProfileEvent>((event, emit) => handleGetProfileEvent(event, emit));
  }
  final FirebaseService? firebaseService;
  handleGetProfileEvent(
      GetProfileEvent event, Emitter<ProfileState> emit) async {
    final result = await firebaseService!.getProfile();
    final newState = state.coppyWith(mainProfile: result);
    emit(newState);
  }
}
