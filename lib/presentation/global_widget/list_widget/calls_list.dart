import 'package:flutter/material.dart';
import 'package:messenger_app/data/fake_data/fake_data.dart';
import 'package:messenger_app/presentation/global_widget/items/call_item.dart';

class CallsList extends StatefulWidget {
  const CallsList({Key? key}) : super(key: key);

  @override
  State<CallsList> createState() => _CallsListState();
}

class _CallsListState extends State<CallsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: calls.length,
        itemBuilder: ((context, index) {
          return Container(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: CallItem(
              call: calls[index],
            ),
          );
        }));
  }
}