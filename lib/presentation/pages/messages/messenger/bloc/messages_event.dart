part of 'messages_bloc.dart';

@immutable
abstract class MessagesEvent {}
class GetTalkMessagesEvent extends MessagesEvent{}