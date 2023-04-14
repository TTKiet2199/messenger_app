import 'package:flutter/material.dart';

import 'package:messenger_app/start/create_name_page.dart';
import 'package:messenger_app/start/enter_phonenumber_page.dart';
import 'package:messenger_app/start/otp_page.dart';
import 'package:messenger_app/start/search_page.dart';
import 'package:messenger_app/start/set_image_page.dart';
import 'package:messenger_app/start/start_page.dart';

import 'contacts/fine_people_nearby_page.dart';
import 'contacts/invite_friends_page.dart';
import 'home/home_page.dart';
import 'messages/channel_page.dart';
import 'messages/group/group_setting_page.dart';
import 'messages/group/new_group_page.dart';
import 'messages/new_mess_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Messenger App',
      initialRoute: 'home',
      routes: {
        'start': (context) => const StartPage(),
        'phone': (context) => const EnterPhoneNumberPage(),
        'otp': (context) => const PhoneNumberVerify(),
        'create': (context) => const CreateNamePage(),
        'image': (context) => const SetImagePage(),
        'home': (context) => const HomePage(),
        'search': (context) => const SearchPage(),
        'newMess': (context) => const NewMessagesPage(),
        'newGroup': (context) => const NewGroupPage(),
        'settingGroup': (context) => const GroupSettingPage(),
        'invite': (context) => const InviteFriendsPage(),
        'channel': (context) => const ChannelPage(),
        'find': (context) => const FindPeopleNearbyPage(),
      },
    );
  }
}
