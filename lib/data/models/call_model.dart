class CallModel {
  String? name;
  String? ava;
  bool? isIncomming;
  String? time;
  CallType? callType;
  CallModel({
    this.name,
    this.ava,
    this.isIncomming,
    this.time,
    this.callType,
  });
}

enum CallType { video, voice }
