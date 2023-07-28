import 'package:flutter/material.dart';
import 'package:messenger_app/data/fake_data/fake_data.dart';
import 'package:messenger_app/presentation/global_widget/items/appbar_item.dart';
import 'package:messenger_app/presentation/global_widget/items/user_item.dart';




class SelectCallPage extends StatefulWidget {
  const SelectCallPage({Key? key}) : super(key: key);

  @override
  State<SelectCallPage> createState() => _SelectCallPageState();
}

class _SelectCallPageState extends State<SelectCallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBarAll(
          name: const Text('Select Contact',style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
          icon1: Icons.arrow_back,
          onTapButtonBack: (){ Navigator.pop(context, 'home');},
          icon2: Icons.search,
          route2: 'search'),
      body: _selectCallList(),
    );
  }

  Widget _selectCallList() {
    return ListView.builder(
        itemCount: userItem.length - 1,
        itemBuilder: ((context, index) {
          return Container(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: Row(
              children: [
                UserItem(
                  user: userItem[index + 1],
                  width: 310,
                ),
                const Icon(
                  Icons.call_outlined,
                  size: 35,
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.videocam_outlined,
                    size: 35,
                  ),
                )
              ],
            ),
          );
        }));
  }
}
