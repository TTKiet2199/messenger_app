import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/core/app_image/app_image.dart';
import 'package:messenger_app/presentation/global_widget/items/appbar_item.dart';
import 'package:messenger_app/presentation/global_widget/items/dropdown_item.dart';




class AddContactPage extends StatefulWidget {
  const AddContactPage({Key? key}) : super(key: key);

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarAll(
          name: Text('Add contact',style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
          icon1: Icons.arrow_back,
          route1: 'home',
          icon2: Icons.check,
          route2: null),
      body: Container(
          padding: const EdgeInsets.only(top: 20),
          alignment: Alignment.center,
          child: Column(
            children: [
              _profileTmageWidget(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: _enterNameTextFiled(),
              ),
              _phoneCountries(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: _confirmPhoneNumber(),
              )
            ],
          )),
    );
  }

  Widget _profileTmageWidget() {
    var imageProvider = image != null
        ? FileImage(image!)
        : const AssetImage(AppImage.profileImage);
    return GestureDetector(
      onTap: () {
        FilePicker.platform.pickFiles(type: FileType.image).then((result) {
          setState(() {
            image = File(result!.files.first.path!);
          });
        });
      },
      child: Container(
        height: 65,
        width: 65,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(140),
            image: DecorationImage(
                fit: BoxFit.cover, image: imageProvider as ImageProvider)),
      ),
    );
  }

  Widget _enterNameTextFiled() {
    return SizedBox(
      height: 60,
      width: 370,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
            hintText: 'Name Contact',
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 0.0),
              child: Icon(Icons.person),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
      ),
    );
  }

  Widget _phoneCountries() {
    return Container(
      width: 370,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          
          border: Border.all(width: 1, color: const Color.fromARGB(120, 26, 3, 3))
          ),
      child: const Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.language_outlined,
              size: 30,
            ),
          ),
          Expanded(child: DropDownButtonCustom1())
        ],
      ),
    );
  }

  Widget _confirmPhoneNumber() {
    return SizedBox(
      height: 60,
      width: 370,
      child: TextField(
        keyboardType: TextInputType.number,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
            hintText: 'Phone Number',
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 0.0),
              child: Icon(Icons.call_outlined),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50),
                
                )),
      ),
    );
  }
}
