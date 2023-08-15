import 'package:messenger_app/data/models/talk_model.dart';

class ProfileModel {
  String? name;
  String? image;
  IsOnline? isOnline;
  String? phoneNum;
  ProfileModel({
    this.name,
    this.image,
    this.isOnline,
    this.phoneNum,
  });
}
