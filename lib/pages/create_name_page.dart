import 'package:flutter/material.dart';

class CreateNamePage extends StatefulWidget {
  const CreateNamePage({Key? key}) : super(key: key);

  @override
  State<CreateNamePage> createState() => _CreateNamePageState();
}

class _CreateNamePageState extends State<CreateNamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: const Color.fromARGB(0, 0, 0, 0),
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        title: Container(
          alignment: Alignment.centerRight,
          child: const Text('1 of 2',
              style: TextStyle(fontSize: 17, color: Color(0xFF0E9F9F))),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [
                  _createNameText(),
                  const Padding(padding: EdgeInsets.all(10)),
                  _noteText(),
                ],
              ),
              _enterNameTextFiled(),
              _continueButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _createNameText() {
    return const Center(
      child: Text(
        "Create your name",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _noteText() {
    return const Center(
      child: Text(
        "Get morer people to know your name ",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 17, color: Color(0xFF0E9F9F)),
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
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 0.0),
              child: Icon(Icons.person),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
      ),
    );
  }

  Widget _continueButton() {
    return Container(
      height: 60,
      width: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: const Color(0xFF303030),
      ),
      child: InkWell(
        onTap: (() => Navigator.pushNamed(context, 'image')),
        child: const Center(
            child: Text(
          "Continue",
          style: TextStyle(fontSize: 15, color: Colors.white),
        )),
      ),
    );
  }
}
