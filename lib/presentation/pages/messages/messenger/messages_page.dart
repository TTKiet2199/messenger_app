import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:messenger_app/injection.dart';
import 'package:messenger_app/presentation/global_widget/items/appbar_item.dart';
import 'package:messenger_app/presentation/global_widget/items/floating_button.dart';
import 'package:messenger_app/presentation/pages/messages/messenger/bloc/messages_bloc.dart';

import '../../chat/chat_page.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MessagesBloc>()..add(GetTalkMessagesEvent()),
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
                  const Text("Messages",style: TextStyle(
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
        body: BlocConsumer<MessagesBloc, MessagesState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Stack(children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: listTalkUsers(state),
              ),
              Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.bottomRight,
                  child: const FloatingButton(
                    icon: Icons.create,
                    route: 'newMess',
                  ))
            ]);
          },
        ),
      ),
    );
  }

  Widget listTalkUsers(MessagesState state) {
    return ListView.builder(
      itemCount: (state.listTalkMessages ?? []).length,
      itemBuilder: (BuildContext context, int index) {
        final talkMessages = (state.listTalkMessages ?? [])[index];
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => ChatPages(
                      name: talkMessages.name,
                      image: talkMessages.image,
                      id: talkMessages.id,
                    ))));
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
                    image: DecorationImage(
                        image: NetworkImage(talkMessages.image!))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(talkMessages.name!,
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w400)),
                          Text(
                              talkMessages.time ??
                                  DateFormat.Hm().format(DateTime.now()),
                              style: const TextStyle(
                                  fontSize: 17, color: Color(0xFF0E9F9F))),
                        ],
                      ),
                    ),
                    SizedBox(
                        height: 30,
                        child: Text(
                          talkMessages.messContent ?? "content",
                          style: const TextStyle(
                              fontSize: 17, color: Color(0xFF0E9F9F)),
                        )),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
