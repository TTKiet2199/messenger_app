import 'package:flutter/material.dart';
import 'package:messenger_app/item_list/mess_list.dart';
import 'package:messenger_app/items/floating_button.dart';

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
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: MessList(),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.bottomRight,
          child: const FloatingButton(icon: Icons.create, route: 'newMess',)
        )
      ]),
    );
  }

 
}
