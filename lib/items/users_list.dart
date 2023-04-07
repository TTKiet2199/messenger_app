import 'package:flutter/material.dart';

class UsersList extends StatefulWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: ((context, index) {
            return Container(
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  _avataImage(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: _userText(),
                  )
                ],
              ),
            );
          })),
    );
  }
  Widget _avataImage() {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color.fromARGB(255, 233, 235, 235)),
      child: const Icon(
        Icons.person_outline_outlined,
        size: 35,
      ),
    );
  }

  Widget _userText() {
    return SizedBox(
        width: 170,
        height: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("User name",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400)),
            SizedBox(
              width: 150,
              height: 20,
              child: Text(
                "active status",
                style: TextStyle(fontSize: 17, color: Color(0xFF0E9F9F)),
              ),
            )
          ],
        ));
  }
}