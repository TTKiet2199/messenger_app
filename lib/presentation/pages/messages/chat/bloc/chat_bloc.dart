import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(const ChatState()) {
    on<ChatEvent>((event, emit) {

    });
    on<EnterTextEvent>((event, emit) => handleEnterTextEvent(event, emit));
  }

  handleEnterTextEvent(EnterTextEvent event, Emitter<ChatState> emit) {
    final newText = state.coppyWith(content: event.enterText, showButton: event.enterText.isEmpty);
    emit(newText);
  }
}
