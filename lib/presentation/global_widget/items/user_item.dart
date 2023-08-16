import 'package:flutter/material.dart';

import '../../../data/models/user_model.dart';

class UserItem extends StatefulWidget {
  const UserItem({Key? key, required this.user, required this.width})
      : super(key: key);
  final UserModel user;
  final double width;
  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: widget.width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          _avataImage(),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: _userText(),
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
            image: DecorationImage(
                image: AssetImage(widget.user.ava!), fit: BoxFit.cover)));
  }

  Widget _userText() {
    return SizedBox(
        height: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.user.userName!,
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
}
