import 'dart:io';

import 'package:flutter/material.dart';

class CallObject {
  String? name;
  IconData? ava;
  bool? isIncomming;
  DateTime? time;
  CallType? callType;
}

enum CallType { video, voice }

class UserObject {
  String user;
  String ava;
  bool activeStatus;
  bool? isReed = false;
  UserObject(
      {required this.user, this.isReed,required this.activeStatus, required this.ava});
}
class Profile {
  String user;
  String ava;
  bool activeStatus;
  bool? isReed = false;
  Profile(
      {required this.user, this.isReed,required this.activeStatus, required this.ava});
}

class messObject{

}

class phoneNum {
  int? phoneNumber;
  int? otp;
}
