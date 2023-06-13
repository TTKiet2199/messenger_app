import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SetImageAndName extends StatefulWidget {
  SetImageAndName({Key? key, required this.hintText, required this.icon}) : super(key: key);
  String? hintText;
  IconData? icon;
  @override
  State<SetImageAndName> createState() => _SetImageAndNameState();
}

class _SetImageAndNameState extends State<SetImageAndName> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 10, color: Color.fromARGB(22, 0, 0, 0)),
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [profileTmageWidget(), _enterGroupNameTextFiled()],
      ),
    );
  }

  Widget profileTmageWidget() {
    var imageProvider = image != null
        ? FileImage(image!)
        : const AssetImage("assets/images/Input Image.png");
    return Column(
      children: [
        GestureDetector(
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
        ),
        const Center(
          child: Text(
            'Upload',
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
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
            hintText: widget.hintText,
            prefixIcon:  Padding(
              padding: const EdgeInsets.only(left: 0.0),
              child: Icon(widget.icon),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
      ),
    );
  }
}
