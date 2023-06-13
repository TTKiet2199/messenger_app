import 'package:flutter/material.dart';

class NavigatorButton extends StatefulWidget {
   NavigatorButton({Key? key, required this.nameButton, required this.route}) : super(key: key);
  String? nameButton;
  String? route;
  @override
  State<NavigatorButton> createState() => _NavigatorButtonState();
}

class _NavigatorButtonState extends State<NavigatorButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: const Color(0xFF303030),
      ),
      child: InkWell(
        onTap: (() => Navigator.pushNamed(context, widget.route!)),
        child:  Center(
            child: Text(
          widget.nameButton!,
          style: const TextStyle(fontSize: 15, color: Colors.white),
        )),
      ),
    );
  }
}
