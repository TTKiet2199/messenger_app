import 'package:flutter/material.dart';
import 'package:messenger_app/items/appbar_item.dart';
import 'package:messenger_app/models/chat_model.dart';
import 'package:messenger_app/models/mess_model.dart';

class ChatPages extends StatefulWidget {
  const ChatPages({Key? key, required this.name}) : super(key: key);
  final MessObject name;

  @override
  State<ChatPages> createState() => _ChatPagesState();
}

class _ChatPagesState extends State<ChatPages> {
  List<ChatObject> message = [];
  final TextEditingController chatController = TextEditingController();
  bool? check;
  ChatObject content = ChatObject(content: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarAll(
          name: SizedBox(
              height: 70,
              width: 300,
              child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                                image: AssetImage(widget.name.image!),
                                fit: BoxFit.cover))),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                          height: 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.name.name!,
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400)),
                              SizedBox(
                                height: 20,
                                child: widget.name.isOnline == IsOnline.onLine
                                    ? const Text(
                                        'online',
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.lime),
                                      )
                                    : const Text(
                                        'offline',
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xFF9E9F9F)),
                                      ),
                              ),
                            ],
                          )),
                    ),
                  ])),
          icon1: Icons.arrow_back,
          route1: 'home',
          icon2: Icons.more_vert,
          route2: 'userProfile'),
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
                bottom: message[index].typeChat == TypeChat.send ? 5 : 10),
            child: Align(
              alignment: Alignment.topRight,
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.only(left: 100),
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
                  padding: const EdgeInsets.only(top: 2),
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
              content.content = Text;
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
                            : message.add(content);
                        content = ChatObject(content: '');
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
