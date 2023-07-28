part of 'chat_bloc.dart';

@immutable
class ChatState {
  final String? content;
  final bool? showButton;
  final List<ChatObject>? listContent;

  const ChatState({this.listContent, this.content, this.showButton});
  ChatState coppyWith({
    String? content,
    bool? showButton,
    List<ChatObject>? listContent,
  }) =>
      ChatState(
        content: content ?? this.content,
        showButton: showButton ?? this.showButton,
        listContent: listContent?? this.listContent,
      );
}
