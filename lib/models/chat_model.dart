import 'package:flutter/material.dart';

class ChatObject {
  String? content;
  TypeChat? typeChat;
  String? time;
  ChatObject({this.content, this.time, this.typeChat});
}

enum TypeChat { send, recived }
