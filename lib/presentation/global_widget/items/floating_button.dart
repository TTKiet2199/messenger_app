import 'package:flutter/material.dart';

class FloatingButton extends StatefulWidget {
 const FloatingButton({Key? key, required this.icon, required this.route}) : super(key: key);
 final IconData icon;
 final String route;
  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (() => Navigator.pushNamed(context, widget.route)),
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70), color: Colors.black),
        child: Icon(
          widget.icon,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }
}
