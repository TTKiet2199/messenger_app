import 'package:flutter/material.dart';
import 'package:messenger_app/items/appbar_item.dart';
import 'package:messenger_app/items/option_button.dart';
import 'package:messenger_app/item_list/users_list.dart';

class NewMessagesPage extends StatefulWidget {
  const NewMessagesPage({Key? key}) : super(key: key);

  @override
  State<NewMessagesPage> createState() => _NewMessagesPageState();
}

class _NewMessagesPageState extends State<NewMessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarAll(
          name: Text('New message',style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
          icon1: Icons.arrow_back,
          route1: 'home',
          icon2: Icons.search,
          route2: 'search'),
      body: Column(
        children: [
          OptionButton(
            height: 180,
            nameOption: const ['New group', 'New channel'],
            iconOption: const [
              Icons.group_outlined,
              Icons.smart_display_outlined
            ],
            route: const ['newGroup', 'channel'],
            widthSide: 10,
          ),
          const UsersList(
            width: 300,
          ),
        ],
      ),
    );
  }
}
