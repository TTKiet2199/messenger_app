import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ItemOtpTextField extends StatefulWidget {
  const ItemOtpTextField(
      {Key? key, required this.controller, required this.onChange})
      : super(key: key);
  final TextEditingController controller;
  final Function() onChange;

  @override
  State<ItemOtpTextField> createState() => _ItemOtpTextFieldState();
}

class _ItemOtpTextFieldState extends State<ItemOtpTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 70,
      child: TextField(
        controller: widget.controller,
        onChanged: (value) {
          widget.onChange.call();
        },
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
      ),
    );
  }
}
