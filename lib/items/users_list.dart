import 'package:flutter/material.dart';
import 'package:messenger_app/fake_data/fake_data.dart';
import 'package:messenger_app/items/user_item.dart';
import 'package:messenger_app/objects/all_item_objects.dart';

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
          itemCount: userItem.length-1,
          itemBuilder: ((context, index) {
            return Container(
              padding: const EdgeInsets.only(top: 10, left: 20),
              child:  UserItem(user: userItem[index+1],),
            );
          })),
    );
  }
  
}
class MProfile extends StatefulWidget {
   MProfile({Key? key, required this.route}) : super(key: key);
List<String> route=[];
  @override
  State<MProfile> createState() => _MProfileState();
}

class _MProfileState extends State<MProfile> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: ((context, index) {
          return InkWell(
            onTap: ,
            child: Container(
              padding: const EdgeInsets.only(top: 10, left: 20),
              child:  UserItem(user: userItem[0]),
            ),
          );
        }));
  }
  
}