import 'package:intl/intl.dart';
import 'package:messenger_app/app_image/app_image.dart';
import 'package:messenger_app/models/call_model.dart';
import 'package:messenger_app/models/mess_model.dart';

import '../models/user_model.dart';

List<UserObject> userItem = [
  UserObject(
      user: 'Hehehehe',
      activeStatus: true,
      ava: AppImage.profileImage,
      isSelected: true),
  UserObject(
      user: 'ahihi',
      activeStatus: true,
      ava: AppImage.userImage1,
      isSelected: true),
  UserObject(
    user: 'hihihihi',
    activeStatus: false,
    ava: AppImage.userImage2,
  ),
  UserObject(
    user: 'hihi123',
    activeStatus: false,
    ava: AppImage.userImage2,
    
  ),
  UserObject(
    user: 'hih3333',
    activeStatus: false,
    ava: AppImage.userImage2,
  ),
  UserObject(
    user: 'hihih33344',
    activeStatus: false,
    ava: AppImage.userImage2,
    isSelected: true
  ),
  UserObject(
    user: 'hihihihi223',
    activeStatus: false,
    ava: AppImage.userImage2,
    isSelected: true
  ),
  UserObject(
    user: 'hihihihi111',
    activeStatus: false,
    ava: AppImage.userImage2,
  ),
  UserObject(
    user: 'VitaminJ',
    activeStatus: false,
    ava: AppImage.userImage2,
    isSelected: true
  ),
];
List<CallObject> calls = [
  CallObject(
      name: 'ahihi',
      ava: AppImage.userImage1,
      isIncomming: false,
      time:
          '${DateFormat.MMMMd().format(DateTime.now())},${DateTime.now().hour}:${DateTime.now().minute}',
      callType: CallType.voice),
  CallObject(
      name: 'hihihihi',
      ava: AppImage.userImage2,
      isIncomming: true,
      time:
          '${DateFormat.MMMMd().format(DateTime.now())},${DateTime.now().hour}:${DateTime.now().minute}',
      callType: CallType.video),
  CallObject(
      name: 'hahaha',
      ava: AppImage.userImage3,
      isIncomming: false,
      time:
          '${DateFormat.MMMMd().format(DateTime.now())},${DateTime.now().hour}:${DateTime.now().minute}',
      callType: CallType.video),
  CallObject(
      name: 'lêu lêu',
      ava: AppImage.userImage5,
      isIncomming: true,
      time:
          '${DateFormat.MMMMd().format(DateTime.now())},${DateTime.now().hour}:${DateTime.now().minute}',
      callType: CallType.voice),
];
List<MessObject> mess = [
  MessObject(
      name: 'ahihi',
      image: AppImage.userImage8,
      isOnline: IsOnline.onLine,
      messContent: 'hihihahahuhu',
      time: '${DateTime.now().hour}:${DateTime.now().minute}',
      inbox: Inbox.recive,
      isReed: true),
  MessObject(
      name: 'hihihihi',
      image: AppImage.userImage4,
      isOnline: IsOnline.offLine,
      messContent: 'lalalulale',
      time: DateFormat.MMMMd().format(DateTime.now()),
      seen: false,
      isReed: true,
      inbox: Inbox.sent),
  MessObject(
      name: 'hahaha',
      image: AppImage.userImage6,
      isOnline: IsOnline.onLine,
      messContent: 'blabluble',
      time: '${DateTime.now().hour}:${DateTime.now().minute}',
      isReed: false,
      numMesUnReed: 5,
      inbox: Inbox.recive),
  MessObject(
      name: 'lêu lêu',
      image: AppImage.userImage3,
      isOnline: IsOnline.offLine,
      messContent: 'balabolobele',
      time: 'yesterday',
      inbox: Inbox.sent,
      seen: true)
];
