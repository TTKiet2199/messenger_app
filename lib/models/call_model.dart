import 'package:flutter/cupertino.dart';

class CallObject {
  String? name;
  IconData? ava;
  bool? isIncomming;
  DateTime? time;
  CallType? callType;
}

enum CallType { video, voice }