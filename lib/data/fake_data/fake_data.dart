import 'package:intl/intl.dart';
import 'package:messenger_app/core/app_image/app_image.dart';
import 'package:messenger_app/data/models/call_model.dart';
import 'package:messenger_app/data/models/chat_model.dart';
import 'package:messenger_app/data/models/talk_model.dart';

import '../models/user_model.dart';

List<UserModel> userItem = [
  UserModel(
      userName: 'Hehehehe',
      activeStatus: true,
      ava: AppImage.profileImage,
      isSelected: true),
  UserModel(
      userName: 'ahihi',
      activeStatus: true,
      ava: AppImage.userImage1,
      isSelected: true),
  UserModel(
    userName: 'hihihihi',
    activeStatus: false,
    ava: AppImage.userImage2,
  ),
  UserModel(
    userName: 'hihi123',
    activeStatus: false,
    ava: AppImage.userImage4,
  ),
  UserModel(
    userName: 'hih3333',
    activeStatus: false,
    ava: AppImage.userImage6,
  ),
  UserModel(
      userName: 'hihih33344',
      activeStatus: false,
      ava: AppImage.userImage7,
      isSelected: true),
  UserModel(
      userName: 'hihihihi223',
      activeStatus: false,
      ava: AppImage.userImage9,
      isSelected: true),
  UserModel(
    userName: 'hihihihi111',
    activeStatus: false,
    ava: AppImage.userImage5,
  ),
  UserModel(
      userName: 'VitaminJ',
      activeStatus: false,
      ava: AppImage.userImage10,
      isSelected: true),
  UserModel(
      userName: 'Hehehehe',
      activeStatus: true,
      ava: AppImage.profileImage,
      isSelected: true),
  UserModel(
      userName: 'ahihi',
      activeStatus: true,
      ava: AppImage.userImage1,
      isSelected: true),
  UserModel(
    userName: 'hihihihi',
    activeStatus: false,
    ava: AppImage.userImage2,
  ),
  UserModel(
    userName: 'hihi123',
    activeStatus: false,
    ava: AppImage.userImage4,
  ),
  UserModel(
    userName: 'hih3333',
    activeStatus: false,
    ava: AppImage.userImage6,
  ),
  UserModel(
      userName: 'hihih33344',
      activeStatus: false,
      ava: AppImage.userImage7,
      isSelected: true),
  UserModel(
      userName: 'hihihihi223',
      activeStatus: false,
      ava: AppImage.userImage9,
      isSelected: true),
  UserModel(
    userName: 'hihihihi111',
    activeStatus: false,
    ava: AppImage.userImage5,
  ),
  UserModel(
      userName: 'VitaminJ',
      activeStatus: false,
      ava: AppImage.userImage10,
      isSelected: true),
  UserModel(
      userName: 'Hehehehe',
      activeStatus: true,
      ava: AppImage.profileImage,
      isSelected: true),
  UserModel(
      userName: 'ahihi',
      activeStatus: true,
      ava: AppImage.userImage1,
      isSelected: true),
  UserModel(
    userName: 'hihihihi',
    activeStatus: false,
    ava: AppImage.userImage2,
  ),
  UserModel(
    userName: 'hihi123',
    activeStatus: false,
    ava: AppImage.userImage4,
  ),
  UserModel(
    userName: 'hih3333',
    activeStatus: false,
    ava: AppImage.userImage6,
  ),
  UserModel(
      userName: 'hihih33344',
      activeStatus: false,
      ava: AppImage.userImage7,
      isSelected: true),
  UserModel(
      userName: 'hihihihi223',
      activeStatus: false,
      ava: AppImage.userImage9,
      isSelected: true),
  UserModel(
    userName: 'hihihihi111',
    activeStatus: false,
    ava: AppImage.userImage5,
  ),
  UserModel(
      userName: 'VitaminJ',
      activeStatus: false,
      ava: AppImage.userImage10,
      isSelected: true),
  UserModel(
      userName: 'Hehehehe',
      activeStatus: true,
      ava: AppImage.profileImage,
      isSelected: true),
  UserModel(
      userName: 'ahihi',
      activeStatus: true,
      ava: AppImage.userImage1,
      isSelected: true),
  UserModel(
    userName: 'hihihihi',
    activeStatus: false,
    ava: AppImage.userImage2,
  ),
  UserModel(
    userName: 'hihi123',
    activeStatus: false,
    ava: AppImage.userImage4,
  ),
  UserModel(
    userName: 'hih3333',
    activeStatus: false,
    ava: AppImage.userImage6,
  ),
  UserModel(
      userName: 'hihih33344',
      activeStatus: false,
      ava: AppImage.userImage7,
      isSelected: true),
  UserModel(
      userName: 'hihihihi223',
      activeStatus: false,
      ava: AppImage.userImage9,
      isSelected: true),
  UserModel(
    userName: 'hihihihi111',
    activeStatus: false,
    ava: AppImage.userImage5,
  ),
  UserModel(
      userName: 'VitaminJ',
      activeStatus: false,
      ava: AppImage.userImage10,
      isSelected: true),
  UserModel(
      userName: 'Hehehehe',
      activeStatus: true,
      ava: AppImage.profileImage,
      isSelected: true),
  UserModel(
      userName: 'ahihi',
      activeStatus: true,
      ava: AppImage.userImage1,
      isSelected: true),
  UserModel(
    userName: 'hihihihi',
    activeStatus: false,
    ava: AppImage.userImage2,
  ),
  UserModel(
    userName: 'hihi123',
    activeStatus: false,
    ava: AppImage.userImage4,
  ),
  UserModel(
    userName: 'hih3333',
    activeStatus: false,
    ava: AppImage.userImage6,
  ),
  UserModel(
      userName: 'hihih33344',
      activeStatus: false,
      ava: AppImage.userImage7,
      isSelected: true),
  UserModel(
      userName: 'hihihihi223',
      activeStatus: false,
      ava: AppImage.userImage9,
      isSelected: true),
  UserModel(
    userName: 'hihihihi111',
    activeStatus: false,
    ava: AppImage.userImage5,
  ),
  UserModel(
      userName: 'VitaminJ',
      activeStatus: false,
      ava: AppImage.userImage10,
      isSelected: true),
];
List<CallModel> calls = [
  CallModel(
      name: 'ahihi',
      ava: AppImage.userImage1,
      isIncomming: false,
      time:
          '${DateFormat.MMMMd().format(DateTime.now())},${DateTime.now().hour}:${DateTime.now().minute}',
      callType: CallType.voice),
  CallModel(
      name: 'hihihihi',
      ava: AppImage.userImage2,
      isIncomming: true,
      time:
          '${DateFormat.MMMMd().format(DateTime.now())},${DateTime.now().hour}:${DateTime.now().minute}',
      callType: CallType.video),
  CallModel(
      name: 'hahaha',
      ava: AppImage.userImage3,
      isIncomming: false,
      time:
          '${DateFormat.MMMMd().format(DateTime.now())},${DateTime.now().hour}:${DateTime.now().minute}',
      callType: CallType.video),
  CallModel(
      name: 'lêu lêu',
      ava: AppImage.userImage5,
      isIncomming: true,
      time:
          '${DateFormat.MMMMd().format(DateTime.now())},${DateTime.now().hour}:${DateTime.now().minute}',
      callType: CallType.voice),
];
List<TalkModel> mess = [
  TalkModel(
      name: 'ahihi',
      image: AppImage.userImage8,
      isOnline: IsOnline.onLine,
      messContent: 'hihihahahuhu',
      time: '${DateTime.now().hour}:${DateTime.now().minute}',
      inbox: Inbox.recive,
      isReed: true),
  TalkModel(
      name: 'hihihihi',
      image: AppImage.userImage4,
      isOnline: IsOnline.offLine,
      messContent: 'lalalulale',
      time: DateFormat.MMMMd().format(DateTime.now()),
      seen: false,
      isReed: true,
      inbox: Inbox.sent),
  TalkModel(
      name: 'hahaha',
      image: AppImage.userImage6,
      isOnline: IsOnline.onLine,
      messContent: 'blabluble',
      time: '${DateTime.now().hour}:${DateTime.now().minute}',
      isReed: false,
      numMesUnReed: 5,
      inbox: Inbox.recive),
  TalkModel(
      name: 'lêu lêu',
      image: AppImage.userImage3,
      isOnline: IsOnline.offLine,
      messContent: 'balabolobele',
      time: 'yesterday',
      inbox: Inbox.sent,
      seen: true)
];
List<ChatModel> messages = [
  ChatModel(typeChat: TypeChat.recived),
  ChatModel(typeChat: TypeChat.send),
  ChatModel(typeChat: TypeChat.recived),
  ChatModel(typeChat: TypeChat.send),
  ChatModel(typeChat: TypeChat.recived),
];
addMessages(ChatModel content) {
  messages.add(content);
}
