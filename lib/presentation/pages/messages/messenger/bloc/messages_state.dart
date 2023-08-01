part of 'messages_bloc.dart';

@immutable
class MessagesState {
  final List<TalkModel>? listTalkMessages;

  const MessagesState({this.listTalkMessages});
  MessagesState coppyWith({
    List<TalkModel>? listTalkMessages,
  }) =>
      MessagesState(
        listTalkMessages: listTalkMessages ?? this.listTalkMessages,
      );
}
