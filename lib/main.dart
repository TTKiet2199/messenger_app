import 'package:flutter/material.dart';
import 'package:messenger_app/pages/enter_phonenumber_page.dart';
import 'package:messenger_app/pages/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messenger App',
      initialRoute: 'enter',
      routes: {
        'start': ((context) => const StartPage()),
        'enter':((context) => const EnterPhoneNumberPage())

      },
    );
  }
}
