import 'package:flutter/material.dart';
import 'package:messenger_app/items/floating_button.dart';
import 'package:messenger_app/items/option_button.dart';
import 'package:messenger_app/items/users_list.dart';

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
              iconButton1: Icons.person_add_outlined,
              iconButton2: Icons.fmd_good_outlined,
              nameButton1: 'Invite friends',
              nameButton2: 'Find people nearby',
              route1: 'invite',
              route2: 'find',
            ),
            const UsersList()
          ],
        ),
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.bottomRight,
          child:  FloatingButton(icon: Icons.person_add_alt_1_outlined,),
        )
      ],
    ));
  }
}
