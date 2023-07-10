import 'dart:io';

import 'package:flutter/material.dart';
import 'package:messenger_app/fake_data/fake_data.dart';
import 'package:messenger_app/items/appbar_item.dart';
import 'package:messenger_app/items/set_image_and_name.dart';
import 'package:messenger_app/item_list/users_list.dart';

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
      appBar: const AppBarAll(
          name: Text('New group',style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
          icon1: Icons.arrow_back,
          route1: 'newGroup',
          icon2: Icons.check,
          route2: null),
      body: Column(
        children: [
          SetImageAndName(
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
