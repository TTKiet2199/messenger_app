import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger_app/core/services/firebase_service.dart';
import 'package:messenger_app/data/models/talk_model.dart';
import 'package:meta/meta.dart';

part 'messages_event.dart';
part 'messages_state.dart';

@injectable
class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  MessagesBloc(this.firebaseService) : super(const MessagesState()) {
    on<MessagesEvent>((event, emit) {});
    on<GetTalkMessagesEvent>(
        (event, emit) => hanldeGetTalkMessagesEvent(event, emit));
  }
  final FirebaseService? firebaseService;

  hanldeGetTalkMessagesEvent(
      GetTalkMessagesEvent event, Emitter<MessagesState> emit) async {
    final result = await firebaseService!.getTalkMessage();
    final newState = state.coppyWith(listTalkMessages: result);
    emit(newState);
  }
}
