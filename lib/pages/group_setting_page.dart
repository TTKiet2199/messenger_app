import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

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
          _setImageAndName(),
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: _memberText()),
          _userList()
        ],
      ),
    );
  }

  Widget _setImageAndName() {
    return Container(
      height: 350,
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 10, color: Color.fromARGB(22, 0, 0, 0)),
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          _profileTmageWidget(),
          _uploadText(),
          _enterGroupNameTextFiled()
        ],
      ),
    );
  }

  Widget _profileTmageWidget() {
    var imageProvider = image != null
        ? FileImage(image!)
        : const AssetImage("assets/images/Input Image.png");
    return GestureDetector(
      onTap: () {
        FilePicker.platform.pickFiles(type: FileType.image).then((result) {
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
                fit: BoxFit.cover, image: imageProvider as ImageProvider)),
      ),
    );
  }

  Widget _uploadText() {
    return const Center(
      child: Text(
        'Upload',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _enterGroupNameTextFiled() {
    return SizedBox(
      height: 60,
      width: 370,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
            hintText: 'Group name',
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 0.0),
              child: Icon(Icons.groups_outlined),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
      ),
    );
  }

  Widget _memberText() {
    return const Text(
      'Number of member',
      style: TextStyle(fontSize: 20),
    );
  }

  Widget _userList() {
    return Expanded(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: ((context, index) {
            return Container(
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  _avataImage(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: _userText(),
                  )
                ],
              ),
            );
          })),
    );
  }

  Widget _avataImage() {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color.fromARGB(255, 233, 235, 235)),
      child: const Icon(Icons.person_outline_outlined),
    );
  }

  Widget _userText() {
    return SizedBox(
        width: 170,
        height: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("User name",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400)),
            SizedBox(
              width: 150,
              height: 20,
              child: Text(
                "active status",
                style: TextStyle(fontSize: 17, color: Color(0xFF0E9F9F)),
              ),
            )
          ],
        ));
  }
}
