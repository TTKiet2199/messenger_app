import 'package:flutter/material.dart';

import '../calls/calls_page.dart';
import '../contacts/contacts_page.dart';
import '../messages/messenger/messages_page.dart';
import '../profile/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  final List<Widget> pages = [
    const MessagesPage(),
    const ContactsPage(),
    const CallsPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(),
      body: pages[currentPage],
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color(0xFF0E9F9F),
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              label: 'Messages', icon: Icon(Icons.messenger_outline_outlined)),
          BottomNavigationBarItem(
              label: 'Contacts',
              icon: Icon(
                Icons.group,
              )),
          BottomNavigationBarItem(
              label: 'Calls', icon: Icon(Icons.phone_in_talk)),
          BottomNavigationBarItem(
              label: 'Profile', icon: Icon(Icons.account_box_outlined)),
        ]);
  }
}
