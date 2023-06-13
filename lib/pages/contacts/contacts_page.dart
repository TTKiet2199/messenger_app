import 'package:flutter/material.dart';
import 'package:messenger_app/items/floating_button.dart';
import 'package:messenger_app/items/option_button.dart';
import 'package:messenger_app/item_list/users_list.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            OptionButton(
                height: 170,
                nameOption: const ['Invite Friends', 'Find people nearby'],
                iconOption: const [Icons.person_add_outlined,Icons.fmd_good_outlined],
                route: const ['invite','find'], widthSide: 10,),
             const UsersList(width: 300,)
          ],
        ),
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.bottomRight,
          child: const FloatingButton(
            icon: Icons.person_add_alt_1_outlined, route: 'addContact',
          ),
        )
      ],
    ));
  }
}
