import 'package:flutter/material.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: ((context, index) {
                return Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [_avataImage(), _messText()],
                  ),
                );
              })),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.bottomRight,
          child: _newMessagesButton(),
        )
      ]),
    );
  }

  Widget _avataImage() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color.fromARGB(255, 233, 235, 235)),
      child: const Icon(Icons.person),
    );
  }

  Widget _messText() {
    return Container(
      width: 300,
      height: 80,
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 1, color: Color.fromARGB(94, 0, 0, 0)),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_nameText(), _timeSent()],
      ),
    );
  }

  Widget _nameText() {
    return SizedBox(
        width: 170,
        height: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("User name",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400)),
            SizedBox(
              width: 150,
              height: 20,
              child: Row(
                children: const [
                  Icon(Icons.check),
                  Text(
                    "messages",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, color: Color(0xFF0E9F9F)),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Widget _timeSent() {
    return SizedBox(
      height: 50,
      width: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('${DateTime.now().hour}:${DateTime.now().minute}',
              style: const TextStyle(fontSize: 17, color: Color(0xFF0E9F9F))),
          Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
              child: const Text('2',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17, color: Colors.white))),
        ],
      ),
    );
  }

  Widget _newMessagesButton() {
    return FloatingActionButton(
        onPressed: (() => Navigator.pushNamed(context, 'newMess')),
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(70),
          color: Colors.black),
          child: const Icon(Icons.create, color: Colors.white,),
        ),);
  }
}
