import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/data/fake_data/fake_data.dart';
import 'package:messenger_app/presentation/global_widget/items/appbar_item.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key, this.nameUser, this.imageUser})
      : super(key: key);
  final String? nameUser;
  final String? imageUser;
  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  int mute = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMess(
          icon1: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, 'chat');
            },
          ),
          nameAppbar: widget.nameUser!,
          icon2:
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          image: widget.imageUser!),
      body: Column(
        children: [
          muteSlider(),
          customNotification(),
          Expanded(child: gridviewPots())
        ],
      ),
    );
  }

  Widget muteSlider() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 1, color: Color.fromARGB(22, 0, 0, 0)))),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'Mute Notifications',
              style: TextStyle(fontSize: 20),
            ),
            CustomSlidingSegmentedControl(
                height: 20,
                initialValue: mute,
                decoration: BoxDecoration(
                    color: mute == 0
                        ? const Color.fromARGB(106, 99, 99, 108)
                        : Colors.lime,
                    borderRadius: BorderRadius.circular(20)),
                thumbDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(184, 255, 255, 255)),
                children: const {0: Text(''), 1: Text('')},
                onValueChanged: ((value) {
                  setState(() {
                    mute = value as int;
                  });
                }))
          ],
        ),
      ),
    );
  }

  Widget customNotification() {
    return Container(
      height: 70,
      width: 450,
      decoration: const BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 10, color: Color.fromARGB(22, 0, 0, 0)))),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: const Text(
        'Custom Notifications',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget gridviewPots() {
    return GridView.builder(
        itemCount: userItem.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 4 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: ((context, index) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(userItem[index].ava!))),
          );
        }));
  }
}
