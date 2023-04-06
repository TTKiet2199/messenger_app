import 'package:flutter/material.dart';

class NewGroupPage extends StatefulWidget {
  const NewGroupPage({Key? key}) : super(key: key);

  @override
  State<NewGroupPage> createState() => _NewGroupPageState();
}

class _NewGroupPageState extends State<NewGroupPage> {
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
                child: const Text('New group',
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
      body: Stack(
        children: [Column(
          children: [_groupMemberSelected(), _userList()],
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 30),
          alignment: Alignment.bottomCenter,
          child: _nextButton())]
      ),
    );
  }

  Widget _groupMemberSelected() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 120,
      decoration: const BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 1, color: Color.fromARGB(22, 0, 0, 0)))),
      child: GridView.builder(
          itemCount: 5,
          gridDelegate:  const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            childAspectRatio: 144/42,
          ),
          itemBuilder: ((context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color.fromARGB(255, 233, 235, 235)),
              child: InkWell(
                onTap: () {},
                child: const Center(
                  child: Text(
                    'User name',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            );
          })),
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
  Widget _nextButton() {
    return Container(
      height: 60,
      width: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: const Color(0xFF303030),
      ),
      child: InkWell(
        onTap: (() => Navigator.pushNamed(context, 'setting')),
        child: const Center(
            child: Text(
          "Next",
          style: TextStyle(fontSize: 15, color: Colors.white),
        )),
      ),
    );
  }
}
