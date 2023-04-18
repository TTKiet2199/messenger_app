
class UserObject {
  String user;
  String ava;
  bool activeStatus;
  bool? isReed = false;
  UserObject(
      {required this.user,
      this.isReed,
      required this.activeStatus,
      required this.ava});
}
