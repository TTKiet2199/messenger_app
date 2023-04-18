import 'package:flutter/material.dart';
import 'package:messenger_app/pages/contacts/fine_people_nearby_page.dart';
import 'package:messenger_app/pages/contacts/invite_friends_page.dart';

import 'package:messenger_app/pages/messages/new_mess_page.dart';
import 'package:messenger_app/pages/profile/my_profile_page.dart';
import 'package:messenger_app/pages/creat_name/create_name_page.dart';

import 'package:messenger_app/pages/enter_phone_numb/enter_phonenumber_page.dart';
import 'package:messenger_app/pages/otp/otp_page.dart';
import 'package:messenger_app/pages/search/search_page.dart';
import 'package:messenger_app/pages/set_image/set_image_page.dart';
import 'package:messenger_app/pages/start/start_page.dart';

import 'home/home_page.dart';
import 'pages/messages/channel_page.dart';
import 'pages/messages/group/group_setting_page.dart';
import 'pages/messages/group/new_group_page.dart';

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
      initialRoute: 'phone',
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
        'profile': (context) => const MyProfile(),
      },
    );
  }
}
