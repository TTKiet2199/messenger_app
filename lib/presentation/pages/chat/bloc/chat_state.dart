part of 'chat_bloc.dart';

@immutable
class ChatState {
  final ChatModel? content;
  final bool? showButton;
  final List<ChatModel>? listContent;
  final bool? uploadContentToTalkResult;
  final bool? uploadRealtimeDbResult;

  const ChatState(
      {this.listContent,
      this.content,
      this.showButton,
      this.uploadContentToTalkResult,
      this.uploadRealtimeDbResult});
  ChatState coppyWith({
    ChatModel? content,
    bool? showButton,
    List<ChatModel>? listContent,
    bool? uploadContentToTalkResult,
    bool? uploadRealtimeDbResult,
  }) =>
      ChatState(
        content: content ?? this.content,
        showButton: showButton ?? this.showButton,
        listContent: listContent ?? this.listContent,
        uploadContentToTalkResult:
            uploadContentToTalkResult ?? this.uploadContentToTalkResult,
        uploadRealtimeDbResult:
            uploadRealtimeDbResult ?? this.uploadRealtimeDbResult,
      );
}
