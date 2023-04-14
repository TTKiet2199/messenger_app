import 'package:flutter/material.dart';



import 'package:messenger_app/messages/messages_page.dart';
import 'package:messenger_app/profile/profile_page.dart';

import '../calls/calls_page.dart';
import '../contacts/contacts_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 3;
  final List<String> namePages = ['Messages', 'Contacts', 'Calls', 'Profile'];
  final List<Widget> pages = [
    const MessagesPage(),
    const ContactsPage(),
    const CallsPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white60,
        title: Container(
          alignment: Alignment.centerLeft,
          child: Text(namePages[currentPage],
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
        ),
        actions: [
          currentPage < 3
              ? (currentPage < 2
                  ? GestureDetector(
                      onTap: (() => Navigator.pushNamed(context, 'search')),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: Icon(
                          Icons.search_rounded,
                          color: Colors.black,
                          size: 35,
                        ),
                      ),
                    )
                  : Row(
                    children: [
                      GestureDetector(
                        onTap: (() => Navigator.pushNamed(context, 'search')),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          child: Icon(
                            Icons.search_rounded,
                            color: Colors.black,
                            size: 35,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(Icons.more_vert,color: Colors.black,size: 35,),
                      )
                    ]))
              : Container(),
        ],
      ),
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
