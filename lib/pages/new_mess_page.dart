import 'package:flutter/material.dart';

class NewMessagesPage extends StatefulWidget {
  const NewMessagesPage({Key? key}) : super(key: key);

  @override
  State<NewMessagesPage> createState() => _NewMessagesPageState();
}

class _NewMessagesPageState extends State<NewMessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white60,
        title: Container(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              GestureDetector(
                onTap: (() {
                  Navigator.popAndPushNamed(context, 'home');
                }),
                child: const Icon(
                  Icons.arrow_back,
                  color: Color.fromARGB(170, 0, 0, 0),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: const Text('New messages',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
            ],
          ),
        ),
        actions: [
          GestureDetector(
            onTap: (() => Navigator.pushNamed(context, 'search')),
            child: const Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Icon(
                Icons.search_rounded,
                color: Color.fromARGB(170, 0, 0, 0),
                size: 35,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [_newButton(), _userList()],
      ),
    );
  }

  Widget _newButton() {
    return Container(
      height: 180,
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 10, color: Color.fromARGB(22, 0, 0, 0)),
      )),
      child: Column(
        children: [_newGroup(), _newChannel()],
      ),
    );
  }

  Widget _newGroup() {
    return InkWell(
      onTap: (() => Navigator.pushNamed(context, 'newGroup')),
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        width: 410,
        height: 80,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Color.fromARGB(30, 0, 0, 0)),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(Icons.group_outlined),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'New Group',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _newChannel() {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        height: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(Icons.smart_display_outlined),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'New Channel',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _userList() {
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
      child: const Icon(Icons.person_outline_outlined),
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
