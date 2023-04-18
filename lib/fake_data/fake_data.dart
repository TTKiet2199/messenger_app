import 'package:intl/intl.dart';
import 'package:messenger_app/app_image/app_image.dart';
import 'package:messenger_app/models/call_model.dart';
import 'package:messenger_app/models/mess_model.dart';

import '../models/user_model.dart';

List<UserObject> userItem = [
  UserObject(user: 'Hehehehe', activeStatus: true, ava: AppImage.profileImage),
  UserObject(user: 'ahihi', activeStatus: true, ava: AppImage.userImage1),
  UserObject(
    user: 'hihihihi',
    activeStatus: false,
    ava: AppImage.userImage2,
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
    isReed: true
  ),
  MessObject(
      name: 'hihihihi',
      image: AppImage.userImage4,
      isOnline: IsOnline.onLine,
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
    isOnline: IsOnline.onLine,
    messContent: 'balabolobele',
    time: 'yesterday',
    inbox: Inbox.sent,
    seen: true
  )
];
