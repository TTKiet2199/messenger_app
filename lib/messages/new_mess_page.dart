import 'package:flutter/material.dart';
import 'package:messenger_app/items/option_button.dart';
import 'package:messenger_app/items/users_list.dart';

class NewMessagesPage extends StatefulWidget {
  const NewMessagesPage({Key? key}) : super(key: key);

  @override
  State<NewMessagesPage> createState() => _NewMessagesPageState();
}

class _NewMessagesPageState extends State<NewMessagesPage> {
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
                child: const Text('New messages',
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
            onTap: (() => Navigator.pushNamed(context, 'search')),
            child: const Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Icon(
                Icons.search_rounded,
                color: Color.fromARGB(170, 0, 0, 0),
                size: 35,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          OptionButton(
              height: 180,
              nameOption: const ['New group', 'New channel'],
              iconOption: const [Icons.group_outlined,Icons.smart_display_outlined],
              route: const ['newGroup','channel'], widthSide: 10,),
          const UsersList(),
        ],
      ),
    );
  }
}
