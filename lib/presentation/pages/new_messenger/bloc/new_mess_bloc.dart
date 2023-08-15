import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger_app/core/services/firebase_service.dart';
import 'package:messenger_app/data/models/talk_model.dart';
import 'package:meta/meta.dart';

part 'new_mess_event.dart';
part 'new_mess_state.dart';

@injectable
class NewMessengerBloc extends Bloc<NewMessEvent, NewMessengerState> {
  NewMessengerBloc(this.firebaseService) : super(const NewMessengerState()) {
    on<NewMessEvent>((event, emit) {});
    on<GetUserEvent>((event, emit) => handleGetUserEvent(event, emit));
    on<UploadToTalkEvent>(
        (event, emit) => handleUploadToTalkEvent(event, emit));
  }
  final FirebaseService? firebaseService;
  handleGetUserEvent(
      GetUserEvent event, Emitter<NewMessengerState> emit) async {
    final result = await firebaseService!.getUserTalk();
    final newState = state.coppyWith(listTalk: result);
    emit(newState);
  }

  handleUploadToTalkEvent(
      UploadToTalkEvent event, Emitter<NewMessengerState> emit) async {
    bool result = await firebaseService!
        .uploadTalk(name: event.name, imageUrl: event.image, id: event.id);
    final newState = state.coppyWith(uploadToTalk: result);
    emit(newState);
  }
}
