import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger_app/core/services/firebase_service.dart';
import 'package:meta/meta.dart';

part 'set_image_event.dart';
part 'set_image_state.dart';

@injectable
class SetImageBloc extends Bloc<SetImageEvent, SetImageState> {
  SetImageBloc(this.firebaseService) : super(const SetImageState()) {
    on<SetImageEvent>((event, emit) {});
    on<SetImageProfileEvent>(
        (event, emit) => handleSetImageProfileEvent(event, emit));
    on<UploadImageEvent>((event, emit) => handleUploadImageEvent(event, emit));
  }
  final FirebaseService? firebaseService;
  handleSetImageProfileEvent(
      SetImageProfileEvent event, Emitter<SetImageState> emit) {
    final newState = state.coppyWith(image: event.profileImage);
    emit(newState);
  }

  handleUploadImageEvent(
      UploadImageEvent event, Emitter<SetImageState> emit) async {
   final bool result = await firebaseService!.uploadImage(image: state.image!);
    final newState = state.coppyWith(setImageResult: result);
    emit(newState);
  }
}
