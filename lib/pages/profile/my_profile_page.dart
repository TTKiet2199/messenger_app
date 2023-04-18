import 'package:flutter/material.dart';
import 'package:messenger_app/fake_data/fake_data.dart';
import 'package:messenger_app/items/profile_setting_button.dart';
import 'package:messenger_app/item_list/user_item.dart';
import 'package:messenger_app/item_list/users_list.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white60,
        title: Container(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              GestureDetector(
                onTap: (() {
                  Navigator.popAndPushNamed(context, 'home');
                }),
                child: const Icon(
                  Icons.arrow_back,
                  color: Color.fromARGB(170, 0, 0, 0),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: const Text('My profile',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
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
