part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {}

class EnterTextEvent extends ChatEvent {
 final String enterText;
  EnterTextEvent({required this.enterText});
}
