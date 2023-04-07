import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FloatingButton extends StatefulWidget {
  FloatingButton({Key? key, required this.icon}) : super(key: key);
  IconData icon;
  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (() {}),
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70), color: Colors.black),
        child:  Icon(
          widget.icon,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }
}
