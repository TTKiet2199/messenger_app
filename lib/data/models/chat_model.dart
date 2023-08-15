class ChatModel {
  String? name;
  String? content = '';
  TypeChat? typeChat;
  String? time;
  ChatModel({this.name,this.content, this.time, this.typeChat});
}

enum TypeChat { send, recived }
