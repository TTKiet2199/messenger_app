import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/injection.dart';
import 'package:messenger_app/presentation/global_widget/items/floating_button.dart';
import 'package:messenger_app/presentation/global_widget/items/option_button.dart';
import 'package:messenger_app/presentation/pages/contacts/bloc/contact_bloc.dart';

import '../../global_widget/items/appbar_item.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ContactBloc>()..add(GetListContactEvent()),
      child: Scaffold(
          appBar: AppBarPages(
            size: 70,
            name: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 1, color: Color(0xFFDCDCDC)))),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Contacts",
                        style: TextStyle(
                            fontSize: 25,
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
          body: BlocConsumer<ContactBloc, ContactState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Stack(
                children: [
                  Column(
                    children: [
                      const OptionButton(
                        height: 170,
                        nameOption: ['Invite Friends', 'Find people nearby'],
                        iconOption: [
                          Icons.person_add_outlined,
                          Icons.fmd_good_outlined
                        ],
                        route: ['invite', 'find'],
                        widthSide: 10,
                      ),
                      Expanded(child: contactList(state)),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.bottomRight,
                    child: const FloatingButton(
                      icon: Icons.person_add_alt_1_outlined,
                      route: 'addContact',
                    ),
                  )
                ],
              );
            },
          )),
    );
  }

  Widget contactList(ContactState state) {
    return ListView.builder(
      itemCount: (state.listContact ?? []).length,
      itemBuilder: (BuildContext context, int index) {
        final contact = (state.listContact ?? [])[index];
        return Row(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                  border: const Border(
                    top: BorderSide(width: 1),
                    bottom: BorderSide(width: 1),
                    left: BorderSide(width: 1),
                    right: BorderSide(width: 1),
                  ),
                  image: DecorationImage(image: NetworkImage(contact.ava!))),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contact.userName!,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 20,
                  child: Text(
                    'last active at ${contact.timeSeen}',
                    style:
                        const TextStyle(fontSize: 17, color: Color(0xFF9E9F9F)),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
