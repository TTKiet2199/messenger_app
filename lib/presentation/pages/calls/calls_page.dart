import 'package:flutter/material.dart';
import 'package:messenger_app/presentation/global_widget/list_widget/calls_list.dart';
import 'package:messenger_app/presentation/global_widget/items/floating_button.dart';

import '../../global_widget/items/appbar_item.dart';

class CallsPage extends StatefulWidget {
  const CallsPage({Key? key}) : super(key: key);

  @override
  State<CallsPage> createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    const Text("Calls",style: TextStyle(
                    fontSize: 25,
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
      body: Stack(
        children: [
          const CallsList(),
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomRight,
            child: const FloatingButton(icon: Icons.call_outlined, route: 'selectCall',))
        ],
      ),
    );
  }
}
