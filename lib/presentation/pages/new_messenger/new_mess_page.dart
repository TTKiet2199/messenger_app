import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:messenger_app/injection.dart';
import 'package:messenger_app/presentation/global_widget/items/appbar_item.dart';
import 'package:messenger_app/presentation/global_widget/items/option_button.dart';

import '../../../../../core/services/firebase_service.dart';

import '../chat/chat_page.dart';
import 'bloc/new_mess_bloc.dart';

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
      create: (context) => getIt<NewMessengerBloc>()..add(GetUserEvent()),
      child: Scaffold(
        appBar: AppBarItem(
            name: const Text('New message',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
            icon1: Icons.arrow_back,
            onTapButtonIcon1: () {
              Navigator.pop(context, 'home');
            },
            icon2: Icons.search,
            ),
        body: BlocConsumer<NewMessengerBloc, NewMessengerState>(
          listener: (context, state) {},
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
                Expanded(child: listTalkUsers(state, context)),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget listTalkUsers(NewMessengerState state, BuildContext context) {
    return ListView.builder(
      itemCount: (state.listTalk ?? []).length,
      itemBuilder: (BuildContext context, int index) {
        final talk = (state.listTalk ?? [])[index];
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => ChatPages(
                      name: talk.name,
                      image: talk.image,
                      id: talk.id,
                    ))));
            context.read<NewMessengerBloc>().add(UploadToTalkEvent(
                image: talk.image!, name: talk.name!, id: talk.id!));
          },
          child: Row(
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
                    image: DecorationImage(image: NetworkImage(talk.image!))),
              ),
              Text(talk.name!,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w400))
            ],
          ),
        );
      },
    );
  }
}
