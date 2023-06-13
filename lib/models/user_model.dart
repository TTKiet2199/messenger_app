
class UserObject {
  String user;
  String ava;
  bool activeStatus;
  bool? isSelected = false;
  UserObject(
      {required this.user,
      this.isSelected,
      required this.activeStatus,
      required this.ava});
}
