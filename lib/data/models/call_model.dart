class CallModel {
  String? name;
  String? ava;
  bool? isIncomming;
  String? time;
  CallType? callType;
  CallModel({
    required this.name,
    required this.ava,
    required this.isIncomming,
    required this.time,
    required this.callType,
  });
}

enum CallType { video, voice }
