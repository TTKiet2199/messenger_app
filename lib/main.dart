import 'package:flutter/material.dart';
import 'package:messenger_app/pages/group_setting_page.dart';
import 'package:messenger_app/pages/create_name_page.dart';
import 'package:messenger_app/pages/enter_phonenumber_page.dart';
import 'package:messenger_app/pages/home_page.dart';
import 'package:messenger_app/pages/new_group_page.dart';
import 'package:messenger_app/pages/new_mess_page.dart';
import 'package:messenger_app/pages/otp_page.dart';
import 'package:messenger_app/pages/search_page.dart';
import 'package:messenger_app/pages/set_image_page.dart';
import 'package:messenger_app/pages/start_page.dart';

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
      initialRoute: 'setting',
      routes: {
        'start': (context) => const StartPage(),
        'enter': (context) => const EnterPhoneNumberPage(),
        'otp': (context) => const PhoneNumberVerify(),
        'create': (context) => const CreateNamePage(),
        'image': (context) => const SetImagePage(),
        'home': (context) => const HomePage(),
        'search':(context) => const SearchPage(),
        'newMess':(context) => const NewMessagesPage(),
        'newGroup':(context) => const NewGroupPage(),
        'setting':(context) => const GroupSettingPage(),

      },
    );
  }
}
