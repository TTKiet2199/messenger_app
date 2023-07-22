import 'package:flutter/material.dart';
import 'package:messenger_app/data/fake_data/fake_data.dart';
import 'package:messenger_app/presentation/global_widget/items/appbar_item.dart';
import 'package:messenger_app/presentation/global_widget/items/profile_setting_button.dart';
import 'package:messenger_app/presentation/global_widget/list_widget/users_list.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarAll(
          name: Text('My profile',style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
          icon1: Icons.arrow_back,
          route1: 'home',
          icon2: null,
          route2: null),
      body: Column(children: [
        const MyProfileImage(),
        ProfileSettingButton(
          nameOption: [userItem[0].user, 'name of work', 'phone number'],
          iconOption: const [
            Icons.person_outline_outlined,
            Icons.error_outline_outlined,
            Icons.call_outlined
          ],
          underText: const ['Your name', 'Your bio', 'Your phone number'],
        )
      ]),
    );
  }
}
