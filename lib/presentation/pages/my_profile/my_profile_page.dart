import 'package:flutter/material.dart';
import 'package:messenger_app/presentation/global_widget/items/appbar_item.dart';
import 'package:messenger_app/presentation/global_widget/items/profile_setting_button.dart';
import 'package:messenger_app/presentation/global_widget/list_widget/users_list.dart';

class MyProfile extends StatefulWidget {
  const MyProfile(
      {Key? key, this.profileName, this.profileImage, this.profilePhoneNumber})
      : super(key: key);
  final String? profileName;
  final String? profileImage;
  final String? profilePhoneNumber;
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarItem(
          name: const Text('My profile',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
          icon1: Icons.arrow_back,
          onTapButtonIcon1: () {
            Navigator.pop(context, 'profile');
          },
          icon2: null,
          ),
      body: Column(children: [
        MyProfileImage(
          image: widget.profileImage!,
        ),
        ProfileSettingButton(
          nameOption: [
            widget.profileName!,
            'name of work',
            widget.profilePhoneNumber!
          ],
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
