import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

List<String> nameButton = [
  'Chats',
  'Photos',
  'Videos',
  'Audio',
  'Link',
  'Document'
];
List<Icon> iconButton = const [
  Icon(Icons.chat_bubble_outline_outlined),
  Icon(Icons.photo),
  Icon(Icons.videocam_outlined),
  Icon(Icons.headphones),
  Icon(Icons.link),
  Icon(Icons.feed_outlined),
];

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.white60,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (() {
                  Navigator.popAndPushNamed(context, 'home');
                }),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 360,
                child: TextField(
                    decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(fontSize: 20, color: Color(0xFF0E9F9F)),
                )),
              ),
            ],
          )),
      body: Column(
        children: [_listButton()],
      ),
    );
  }

  Widget _listButton() {
    return Container(
        height: 80,
        decoration: const BoxDecoration(
            border: Border(
                bottom:
                    BorderSide(width: 1, color: Color.fromARGB(94, 0, 0, 0)))),
        child: Container(
            padding: const EdgeInsets.all(5),
            height: 40,
            child: _buttonWidget()));
  }

  Widget _buttonWidget() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: nameButton.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.all(10),
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color.fromARGB(255, 233, 235, 235)),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [iconButton[index], Text(nameButton[index])]),
        );
      },
    );
  }
}
