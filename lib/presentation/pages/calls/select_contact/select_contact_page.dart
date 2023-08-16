import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/injection.dart';
import 'package:messenger_app/presentation/global_widget/items/appbar_item.dart';
import 'package:messenger_app/presentation/pages/calls/select_contact/bloc/select_contact_bloc.dart';

class SelectContactPage extends StatefulWidget {
  const SelectContactPage({Key? key}) : super(key: key);

  @override
  State<SelectContactPage> createState() => _SelectContactPageState();
}

class _SelectContactPageState extends State<SelectContactPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<SelectContactBloc>()..add(GetListCallContactEvent()),
      child: Scaffold(
        appBar: AppBarItem(
            name: const Text('Select Contact',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
            icon1: Icons.arrow_back,
            onTapButtonIcon1: () {
              Navigator.pop(context, 'home');
            },
            icon2: Icons.search,
            onTapButtonIcon2: () {
              Navigator.pushNamed(context, 'search');
            }),
        body: BlocConsumer<SelectContactBloc, SelectContactState>(
          listener: (context, state) {},
          builder: (context, state) {
            return callContactList(state);
          },
        ),
      ),
    );
  }

  Widget callContactList(SelectContactState state) {
    return ListView.builder(
      itemCount: (state.listCallContact ?? []).length,
      itemBuilder: (BuildContext context, int index) {
        final callContact = (state.listCallContact ?? [])[index];
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
                      image: DecorationImage(
                          image: NetworkImage(callContact.ava!))),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(callContact.userName!,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 20,
                      child: Text(
                        'last active at ${callContact.timeSeen}',
                        style: const TextStyle(
                            fontSize: 17, color: Color(0xFF9E9F9F)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Row(
              children: [
                Icon(
                  Icons.call_outlined,
                  size: 35,
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.videocam_outlined,
                    size: 35,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
