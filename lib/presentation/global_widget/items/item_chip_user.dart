import 'package:flutter/material.dart';

class ItemChipUser extends StatefulWidget {
  const ItemChipUser({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  State<ItemChipUser> createState() => _ItemChipUserState();
}

class _ItemChipUserState extends State<ItemChipUser> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return ActionChip(
      clipBehavior: Clip.hardEdge,
      avatar: Icon(
        selected == true ? Icons.close : null,
        color: Colors.white,
      ),
      backgroundColor:
          selected == true ? Colors.black : const Color(0xFFEEEEEE),
      label: Text(
        widget.name,
        style: TextStyle(
            color: selected == false ? Colors.black : Colors.white,
            fontSize: 20),
      ),
      onPressed: () {
        setState(() {
          selected = !selected;
        });
      },
    );
  }
}
