import 'package:flutter/material.dart';
import 'package:messenger_app/presentation/global_widget/items/floating_button.dart';
import 'package:messenger_app/presentation/global_widget/items/option_button.dart';
import 'package:messenger_app/presentation/global_widget/list_widget/users_list.dart';

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
        const Column(
          children: [
            OptionButton(
                height: 170,
                nameOption: ['Invite Friends', 'Find people nearby'],
                iconOption: [Icons.person_add_outlined,Icons.fmd_good_outlined],
                route: ['invite','find'], widthSide: 10,),
             UsersList(width: 300,)
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
