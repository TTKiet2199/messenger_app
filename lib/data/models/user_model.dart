class UserModel {
  String user;
  String ava;
  bool activeStatus;
  bool? isSelected = false;
  UserModel(
      {required this.user,
      this.isSelected,
      required this.activeStatus,
      required this.ava});
}
