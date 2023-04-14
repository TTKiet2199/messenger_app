import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SetImagePage extends StatefulWidget {
  const SetImagePage({Key? key}) : super(key: key);

  @override
  State<SetImagePage> createState() => _SetImagePageState();
}

class _SetImagePageState extends State<SetImagePage> {
  File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: const Color.fromARGB(0, 0, 0, 0),
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: (() {
                  Navigator.popAndPushNamed(context, 'create');
                }),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
            const Text('2 of 2',
                style: TextStyle(fontSize: 17, color: Color(0xFF0E9F9F))),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                _addPhotoText(),
                const Padding(padding: EdgeInsets.all(10)),
                _noteText(),
              ],
            ),
            _profileTmageWidget(),
            _nextButton()
          ],
        ),
      ),
    );
  }

  Widget _addPhotoText() {
    return const Center(
      child: Text(
        "Add your photo",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _noteText() {
    return const Center(
      child: Text(
        "Get morer people to know your better",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 17, color: Color(0xFF0E9F9F)),
      ),
    );
  }

  Widget _profileTmageWidget() {
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

  Widget _nextButton() {
    return Container(
      height: 60,
      width: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: const Color(0xFF303030),
      ),
      child: InkWell(
        onTap: (() => Navigator.pushNamed(context, 'home')),
        child: const Center(
            child: Text(
          "Next",
          style: TextStyle(fontSize: 15, color: Colors.white),
        )),
      ),
    );
  }
}
