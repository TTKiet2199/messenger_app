import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:messenger_app/injection.dart';
import 'package:messenger_app/presentation/global_widget/items/appbar_item.dart';
import 'package:messenger_app/presentation/global_widget/items/option_button.dart';
import 'package:messenger_app/presentation/pages/messages/messenger/new_messenger/bloc/new_mess_bloc.dart';

import '../../../../../core/services/firebase_service.dart';

class NewMessagesPage extends StatefulWidget {
  const NewMessagesPage({Key? key}) : super(key: key);

  @override
  State<NewMessagesPage> createState() => _NewMessagesPageState();
}

class _NewMessagesPageState extends State<NewMessagesPage> {
  FirebaseService? firebaseService;
  @override
  void initState() {
    super.initState();
    firebaseService = GetIt.instance.get<FirebaseService>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NewMessengerBloc>(),
      child: Scaffold(
        appBar: AppBarAll(
            name: const Text('New message',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
            icon1: Icons.arrow_back,
            onTapButtonBack: () {
              Navigator.pop(context, 'home');
            },
            icon2: Icons.search,
            route2: 'search'),
        body: BlocConsumer<NewMessengerBloc, NewMessengerState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Column(
              children: [
                const OptionButton(
                  height: 180,
                  nameOption: ['New group', 'New channel'],
                  iconOption: [
                    Icons.group_outlined,
                    Icons.smart_display_outlined
                  ],
                  route: ['newGroup', 'channel'],
                  widthSide: 10,
                ),
                Expanded(child: listUsers()),
              ],
            );
          },
        ),
      ),
    );
  }
  Widget listUsers(NewMessengerState state) {
    return StreamBuilder<QuerySnapshot>(
      stream: firebaseService!.getUser(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          List posts = snapshot.data!.docs.map((e) => e.data()).toList();
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              Map post = posts[index];
              return InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
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
                              image: NetworkImage(post["image"]))),
                    ),
                    Text(post['name'],
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w400))
                  ],
                ),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
