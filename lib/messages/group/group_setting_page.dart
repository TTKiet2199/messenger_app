import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/fake_data/fake_data.dart';
import 'package:messenger_app/items/set_image_and_name.dart';
import 'package:messenger_app/items/users_list.dart';

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
                child: const Text('New group',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
            ],
          ),
        ),
        actions: [
          GestureDetector(
            onTap: (() => Navigator.pushNamed(context, '')),
            child: const Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Icon(
                Icons.check,
                color: Color.fromARGB(170, 0, 0, 0),
                size: 35,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
           SetImageAndName(hintText: 'Group name', icon: Icons.groups_outlined,),
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: _memberText()),
          const UsersList()
        ],
      ),
    );
  }
  Widget _memberText() {
    return  Text(
      '${userItem.length} member',
      style: const TextStyle(fontSize: 20),
    );
  }

  
}
