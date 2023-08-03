import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger_app/core/services/firebase_service.dart';
import 'package:messenger_app/data/models/chat_model.dart';
import 'package:meta/meta.dart';

part 'chat_event.dart';
part 'chat_state.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc(this.firebaseService) : super(const ChatState()) {
    on<ChatEvent>((event, emit) {});
    on<EnterTextEvent>((event, emit) => handleEnterTextEvent(event, emit));
    on<SendMesageEvent>((event, emit) => handleSendMesageEvent(event, emit));
    on<UploadContentToTalk>(
        (event, emit) => handleUploadContentToTalk(event, emit));
    on<UploadRealtimeDbEvent>(
        (event, emit) => handleUploadRealtimeDbEvent(event, emit));
  }
  final FirebaseService? firebaseService;
  handleEnterTextEvent(EnterTextEvent event, Emitter<ChatState> emit) {
    final newText = state.coppyWith(
        content: event.enterText,
        showButton: event.enterText.toString().isEmpty);
    emit(newText);
  }

  handleSendMesageEvent(SendMesageEvent event, Emitter<ChatState> emit) {
    final currentListMessage = state.listContent ?? [];
    currentListMessage.add(event.newContent);
    emit(state.coppyWith(listContent: currentListMessage));
  }

  handleUploadContentToTalk(
      UploadContentToTalk event, Emitter<ChatState> emit) async {
    final bool result = await firebaseService!
        .uploadContentToTalk(chatContent: event.contentUpload, id: event.id);
    final newState = state.coppyWith(uploadContentToTalkResult: result);
    emit(newState);
  }

  handleUploadRealtimeDbEvent(
      UploadRealtimeDbEvent event, Emitter<ChatState> emit) async {
    final bool reseult = await firebaseService!.uploadContentToRealtimeDB(
        chatModel: event.contentRealtime, id: event.idRealtime);
    final newState = state.coppyWith(uploadRealtimeDbResult: reseult);
    emit(newState);
  }
}
