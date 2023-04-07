import 'package:flutter/material.dart';

class OptionButton extends StatefulWidget {
  OptionButton(
      {Key? key,
      required this.nameButton1,
      required this.iconButton1,
      required this.nameButton2,
      required this.iconButton2,
      required this.route1,
      required this.route2})
      : super(key: key);
  @override
  State<OptionButton> createState() => _OptionButtonState();
  String nameButton1;
  IconData iconButton1;
  String nameButton2;
  IconData iconButton2;
  String route1;
  String route2;
}

class _OptionButtonState extends State<OptionButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 10, color: Color.fromARGB(22, 0, 0, 0)),
      )),
      child: Column(
        children: [_option1(), _option2()],
      ),
    );
  }

  Widget _option1() {
    return InkWell(
      onTap: (() => Navigator.pushNamed(context, widget.route1)),
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
          children: [
            Icon(
              widget.iconButton1,
              size: 35,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                widget.nameButton1,
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _option2() {
    return InkWell(
      onTap: (() => Navigator.pushNamed(context, widget.route2)),
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        height: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              widget.iconButton2,
              size: 35,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                widget.nameButton2,
                style: const TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
