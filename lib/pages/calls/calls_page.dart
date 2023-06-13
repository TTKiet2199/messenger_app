import 'package:flutter/material.dart';
import 'package:messenger_app/item_list/calls_list.dart';
import 'package:messenger_app/items/floating_button.dart';

class CallsPage extends StatefulWidget {
  const CallsPage({Key? key}) : super(key: key);

  @override
  State<CallsPage> createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: const CallsList(),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomRight,
            child: const FloatingButton(icon: Icons.call_outlined, route: 'selectCall',))
        ],
      ),
    );
  }
}
