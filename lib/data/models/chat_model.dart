class ChatModel {
  String? content = '';
  TypeChat? typeChat;
  String? time;
  ChatModel({this.content, this.time, this.typeChat});
}

enum TypeChat { send, recived }
