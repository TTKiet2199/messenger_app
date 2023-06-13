import 'package:flutter/material.dart';
import 'package:messenger_app/fake_data/fake_data.dart';
import 'package:messenger_app/items/mess_item.dart';

class MessList extends StatefulWidget {
  const MessList({Key? key}) : super(key: key);

  @override
  State<MessList> createState() => _MessListState();
}

class _MessListState extends State<MessList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: mess.length,
        itemBuilder: ((context, index) {
          return MessItem(
            meassage: mess[index],
          );
        }));
  }
  }
