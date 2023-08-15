import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/data/fake_data/fake_data.dart';
import 'package:messenger_app/presentation/global_widget/items/user_item.dart';

class UsersList extends StatefulWidget {
  const UsersList({Key? key, required this.width}) : super(key: key);
  final double width;

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: userItem.length - 1,
          itemBuilder: ((context, index) {
            return Container(
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: UserItem(
                user: userItem[index + 1],
                width: widget.width,
              ),
            );
          })),
    );
  }
}

class MProfile extends StatefulWidget {
  const MProfile({Key? key, required this.route, required this.width})
      : super(key: key);
  final List<String> route;
  final double width;
  @override
  State<MProfile> createState() => _MProfileState();
}

class _MProfileState extends State<MProfile> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: ((context, index) {
          return InkWell(
            onTap: (() => Navigator.pushNamed(context, 'profile')),
            child: Container(
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: UserItem(
                user: userItem[0],
                width: widget.width,
              ),
            ),
          );
        }));
  }
}

class MyProfileImage extends StatefulWidget {
  const MyProfileImage({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  State<MyProfileImage> createState() => _MyProfileImageState();
}

class _MyProfileImageState extends State<MyProfileImage> {
  File? image;
  @override
  Widget build(BuildContext context) {
    var imageProvider =
        image != null ? FileImage(image!) : NetworkImage(widget.image);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              FilePicker.platform
                  .pickFiles(type: FileType.image)
                  .then((result) {
                setState(() {
                  image = File(result!.files.first.path!);
                });
              });
            },
            child: Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(140),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: imageProvider as ImageProvider)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Center(
              child: Text(
                'Set profile photo',
                style: TextStyle(fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
