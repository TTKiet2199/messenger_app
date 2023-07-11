import 'package:flutter/material.dart';
import 'package:messenger_app/items/appbar_item.dart';
import 'package:messenger_app/models/mess_model.dart';
import 'package:messenger_app/pages/messages/chat/chat_page.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key, this.nameUser}) : super(key: key);
  final MessObject? nameUser;
  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarMess(
      icon1: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: ((context) => ChatPages(name: widget.nameUser))));
        },
      ),
      icon2: IconButton(
        icon: const Icon(Icons.more_vert),
        onPressed: () {},
      ),
      nameAppbar: widget.nameUser!,
    ));
  }
}
