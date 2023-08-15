import 'package:flutter/material.dart';
import 'package:messenger_app/presentation/global_widget/items/floating_button.dart';
import 'package:messenger_app/presentation/global_widget/items/option_button.dart';
import 'package:messenger_app/presentation/global_widget/list_widget/users_list.dart';

import '../../global_widget/items/appbar_item.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarPages(
            size: 70,
            name: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                  border:
                      Border(bottom: BorderSide(width: 1, color: Color(0xFFDCDCDC)))),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Contacts",style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
                    IconButton(
                      icon: const Icon(Icons.search),
                      iconSize: 32,
                      onPressed: (() {
                        Navigator.pushNamed(context, "search");
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
      )),
    );
  }
}
