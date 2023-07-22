import 'package:flutter/material.dart';
import 'package:messenger_app/data/fake_data/fake_data.dart';
import 'package:messenger_app/presentation/global_widget/list_widget/users_list.dart';
import 'package:messenger_app/presentation/global_widget/items/appbar_item.dart';
import 'package:messenger_app/presentation/global_widget/items/item_chip_user.dart';

class NewGroupPage extends StatefulWidget {
  const NewGroupPage({Key? key}) : super(key: key);

  @override
  State<NewGroupPage> createState() => _NewGroupPageState();
}

class _NewGroupPageState extends State<NewGroupPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarAll(
        icon1: Icons.arrow_back,
        icon2: Icons.search,
        name: Text('New group',style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
        route1: 'newMess',
        route2: 'search',
      ),
      body: Stack(children: [
        Column(
          children: [
            _groupMemberSelected(),
            const UsersList(
              width: 300,
            )
          ],
        ),
        Container(
            padding: const EdgeInsets.only(bottom: 30),
            alignment: Alignment.bottomCenter,
            child: _nextButton())
      ]),
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
      child: ListView(children: [
        Wrap(
          spacing: 5,
          runSpacing: 5,
          children: List.generate(
            userItem.length,
            (index) => 
            userItem[index].isSelected==true?
            ItemChipUser(name: userItem[index].user)
            :Container()
            ,
          ),
        ),
      ]),
    );
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
        onTap: (() => Navigator.pushNamed(context, 'settingGroup')),
        child: const Center(
            child: Text(
          "Next",
          style: TextStyle(fontSize: 15, color: Colors.white),
        )),
      ),
    );
  }
}
