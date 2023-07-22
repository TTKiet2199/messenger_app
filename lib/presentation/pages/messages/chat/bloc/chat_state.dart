part of 'chat_bloc.dart';

@immutable
class ChatState {
  final String? content;
  final bool? showButton;

  const ChatState({this.content, this.showButton});
  ChatState coppyWith({String? content, bool? showButton}) =>
      ChatState(content: content ?? this.content, showButton: showButton??this.showButton);
}
