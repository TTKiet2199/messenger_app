import 'package:flutter/material.dart';
import 'package:messenger_app/item_list/mess_list.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: MessList(),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.bottomRight,
          child: _newMessagesButton(),
        )
      ]),
    );
  }

 
  Widget _newMessagesButton() {
    return FloatingActionButton(
        onPressed: (() => Navigator.pushNamed(context, 'newMess')),
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(70),
          color: Colors.black),
          child: const Icon(Icons.create, color: Colors.white,),
        ),);
  }
}
