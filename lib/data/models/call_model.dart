
class CallObject {
  String? name;
  String? ava;
  bool? isIncomming;
  String? time;
  CallType? callType;
  CallObject({
    required this.name,
    required this.ava,
    required this.isIncomming,
    required this.time,
    required this.callType,
  });
}

enum CallType { video, voice }
