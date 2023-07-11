import 'package:flutter/material.dart';
import 'package:messenger_app/items/appbar_item.dart';
import 'package:messenger_app/models/chat_model.dart';
import 'package:messenger_app/models/mess_model.dart';
import 'package:messenger_app/pages/profile/user_profile.dart';

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
    return Scaffold(
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
      body: Column(
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
                      top: BorderSide(width: 1, color: Color(0xFFDCDCDC)))),
              child: chatTextField()),
        ],
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
              alignment: 
              message[index].typeChat != TypeChat.send
                  ? 
                  Alignment.topRight
                  : Alignment.topLeft
                  ,
              child: Column(children: [
                Container(
                  margin: 
                  message[index].typeChat != TypeChat.send
                      ? 
                      const EdgeInsets.only(left: 100)
                      : const EdgeInsets.only(right: 100)
                      ,
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
                  padding: const EdgeInsets.only(top: 2,),
                  child:
                      Text('${DateTime.now().hour}:${DateTime.now().minute}'),
                ),
              ]),
            ),
          );
        }));
  }

  Widget chatTextField() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        child: TextField(
            maxLines: null,
            onChanged: (Text) {
              chatController.text.isEmpty ? check = true : check = false;
              newContent.content = Text;
              // print(check);
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
              suffixIcon: Padding(
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
              )
              // : Padding(
              //     padding: const EdgeInsets.only(right: 0),
              //     child: SizedBox(
              //       width: 150,
              //       child: Row(
              //           mainAxisAlignment: MainAxisAlignment.end,
              //           children: [
              //             IconButton(
              //                 onPressed: (() {}),
              //                 icon: const Icon(Icons.attachment_outlined)),
              //             IconButton(
              //                 onPressed: (() {}),
              //                 icon: const Icon(Icons.camera_alt_outlined)),
              //             IconButton(
              //                 onPressed: (() {}),
              //                 icon: const Icon(Icons.mic_outlined))
              //           ]),
              //     ),
              ,
            )),
      ),
    );
  }
}
