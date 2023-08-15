part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {}

class EnterTextEvent extends ChatEvent {
  final ChatModel enterText;
  EnterTextEvent({required this.enterText});
}

class SendMesageEvent extends ChatEvent {
  final ChatModel newContent;

  SendMesageEvent({required this.newContent});
}

class UploadContentToTalk extends ChatEvent {
  final ChatModel contentUpload;
  final String id;

  UploadContentToTalk({required this.contentUpload, required this.id});
}

class UploadRealtimeDbEvent extends ChatEvent {
  final ChatModel contentRealtime;
  final String idRealtime;
  final String realtimeName;

  UploadRealtimeDbEvent(
      {required this.realtimeName,
      required this.contentRealtime,
      required this.idRealtime});
}
