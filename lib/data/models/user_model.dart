class UserModel {
  String? userName;
  String? ava;
  bool? activeStatus;
  bool? isSelected = false;
  String? timeSeen;
  UserModel({
    this.userName,
    this.timeSeen,
    this.isSelected,
    this.activeStatus,
    this.ava,
  });
}
