import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/presentation/global_widget/items/appbar_item.dart';
import 'package:messenger_app/data/models/chat_model.dart';
import 'package:messenger_app/data/models/mess_model.dart';

import '../../profile/user_profile.dart';
import 'bloc/chat_bloc.dart';



class ChatPages extends StatefulWidget {
  const ChatPages({Key? key, this.name}) : super(key: key);
  final MessObject? name;

  @override
  State<ChatPages> createState() => _ChatPagesState();
}

class _ChatPagesState extends State<ChatPages> {
  List<ChatObject> message = [];
  final TextEditingController chatController = TextEditingController();
  bool? check;
  ChatObject newContent = ChatObject(content: '');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc(),
      child: Scaffold(
        appBar: AppBarMess(
          icon1: IconButton(
            icon: const Icon(Icons.arrow_back),
            
            onPressed: () {
              Navigator.pushNamed(context, 'home');
            },
          ),
          icon2: IconButton(
              onPressed: (() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => UserProfilePage(
                          nameUser: widget.name,
                        ))));
              }),
              icon: const Icon(Icons.more_vert)),
          nameAppbar: widget.name!,
        ),
        body: BlocConsumer<ChatBloc, ChatState>(
          listener: (context, state) {
           
          },
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: chatView(),
                )),
                Container(
                    alignment: Alignment.bottomCenter,
                    decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                width: 1, color: Color(0xFFDCDCDC)))),
                    child: chatTextField(context,state)),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget chatView() {
    return ListView.builder(
        itemCount: message.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: EdgeInsets.only(
                right: 5,
                bottom: message[index].typeChat != TypeChat.send ? 5 : 10),
            child: Align(
              alignment: message[index].typeChat != TypeChat.send
                  ? Alignment.topRight
                  : Alignment.topLeft,
              child: Column(children: [
                Container(
                  margin: message[index].typeChat != TypeChat.send
                      ? const EdgeInsets.only(left: 100)
                      : const EdgeInsets.only(right: 100),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFFEEEEEE)),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    message[index].content!,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 2,
                  ),
                  child:
                      Text('${DateTime.now().hour}:${DateTime.now().minute}'),
                ),
              ]),
            ),
          );
        }));
  }

  Widget chatTextField(BuildContext context, ChatState state) {
    return Builder(builder: (context) {
      final showButton =
          context.select((ChatBloc bloc) => bloc.state.showButton);
      return Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            child: TextField(
              maxLines: null,
              onChanged: (text) {
                context.read<ChatBloc>().add(EnterTextEvent(enterText: text));
              },
              controller: chatController,
              decoration: InputDecoration(
                  hintText: 'Type a message',
                  hintStyle:
                      const TextStyle(fontSize: 20, color: Color(0xFF0E9F9F)),
                  border: InputBorder.none,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: IconButton(
                        onPressed: (() {}),
                        icon: const Icon(Icons.emoji_emotions_outlined)),
                  ),
                  suffixIcon: (showButton ?? true)
                      ? Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: SizedBox(
                            width: 150,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: (() {}),
                                      icon: const Icon(
                                          Icons.attachment_outlined)),
                                  IconButton(
                                      onPressed: (() {}),
                                      icon: const Icon(
                                          Icons.camera_alt_outlined)),
                                  IconButton(
                                      onPressed: (() {}),
                                      icon: const Icon(Icons.mic_outlined))
                                ]),
                          ),
                        )
                      :Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  chatController.text.isEmpty
                                      ? null
                                      : message.add(newContent);
                                  newContent = ChatObject(content: '');
                                  chatController.text = '';
                                });
                              },
                              icon: const Icon(Icons.send_outlined)),
                        ))
                       ,
            ),
          ));
    });
  }
}
