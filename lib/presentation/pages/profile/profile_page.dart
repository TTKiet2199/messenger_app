import 'package:flutter/material.dart';
import 'package:messenger_app/presentation/global_widget/items/option_button.dart';
import 'package:messenger_app/presentation/global_widget/list_widget/users_list.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        _profileItem(),
        _settingsButton(),
        _helpButton()
      ],
    ));
  }

  Widget _profileItem() {
    return Container(
      height: 90,
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 1, color: Color.fromARGB(22, 0, 0, 0)),
      )),
      child:  const MProfile(route: ['profile'], width: 300,),
    );
  }

  Widget _settingsButton() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20,top: 10),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Settings',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        const OptionButton(
            height: 260,
            nameOption: [
              'Notifications',
              'Privacy anh Security',
              'Chats',
              "Storage and Data"
            ],
            iconOption: [
              Icons.notifications_none_outlined,
              Icons.lock_outlined,
              Icons.messenger_outline_outlined,
              Icons.pie_chart_outline
            ],
            route: ['noti','private','chat','storage'],
            widthSide: 10)
      ],
    );
  }
  Widget _helpButton(){
     return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20,top: 10),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Help',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        const OptionButton(
            height: 260,
            nameOption: [
              "What's Up FAQ",
              'Privacy policy',
              'Ask a question',
              'Sign Out'
            ],
            iconOption: [
              Icons.question_mark_outlined,
              Icons.shield_outlined,
              Icons.message_outlined,
             Icons.logout_outlined,
            ],
            route: ['faq','policy','ask','start'],
            widthSide: 0)
      ],
    );
  }
}
