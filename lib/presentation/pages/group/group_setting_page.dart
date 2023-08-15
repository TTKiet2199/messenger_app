import 'dart:io';

import 'package:flutter/material.dart';
import 'package:messenger_app/data/fake_data/fake_data.dart';
import 'package:messenger_app/presentation/global_widget/items/appbar_item.dart';
import 'package:messenger_app/presentation/global_widget/items/set_image_and_name.dart';
import 'package:messenger_app/presentation/global_widget/list_widget/users_list.dart';

class GroupSettingPage extends StatefulWidget {
  const GroupSettingPage({Key? key}) : super(key: key);

  @override
  State<GroupSettingPage> createState() => _GroupSettingPageState();
}

class _GroupSettingPageState extends State<GroupSettingPage> {
  File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarItem(
          name: const Text('New group',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
          icon1: Icons.arrow_back,
          onTapButtonIcon1: () {
            Navigator.pop(context, 'newGroup');
          },
          icon2: Icons.check,
      ),
      body: Column(
        children: [
          const SetImageAndName(
            hintText: 'Group name',
            icon: Icons.groups_outlined,
          ),
          Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: _memberText()),
          const UsersList(
            width: 300,
          )
        ],
      ),
    );
  }

  Widget _memberText() {
    return Text(
      '${userItem.length - 1} member',
      style: const TextStyle(fontSize: 20),
    );
  }
}
