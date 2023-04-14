import 'package:flutter/material.dart';
import 'package:messenger_app/objects/all_item_objects.dart';

class UserItem extends StatefulWidget {
  UserItem({Key? key, required this.user}) : super(key: key);
  UserObject user;
  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              _avataImage(),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: _userText(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: widget.user.isReed == true ? _checkSelected() : Container(),
          ),
        ],
      ),
    );
  }

  Widget _avataImage() {
    return Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            image: DecorationImage(image: AssetImage(widget.user.ava), fit: BoxFit.cover)));
  }

  Widget _userText() {
    return SizedBox(
        height: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.user.user,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w400)),
            SizedBox(
              height: 20,
              child: widget.user.activeStatus == true
                  ? const Text(
                      'online',
                      style: TextStyle(fontSize: 17, color: Colors.lime),
                    )
                  : Text(
                      'Last seen today at ${DateTime.now().hour}:${DateTime.now().minute}',
                      style: const TextStyle(
                          fontSize: 17, color: Color(0xFF9E9F9F)),
                    ),
            ),
          ],
        ));
  }

  Widget _checkSelected() {
    return const Icon(
      Icons.check_circle,
      size: 30,
      color: Colors.black,
    );
  }
}
