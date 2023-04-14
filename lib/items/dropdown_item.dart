import 'package:flutter/material.dart';

class DropDownButtonCustom extends StatefulWidget {
  DropDownButtonCustom({Key? key}) : super(key: key);

  @override
  State<DropDownButtonCustom> createState() => _DropDownButtonCustomState();
}

class _DropDownButtonCustomState extends State<DropDownButtonCustom> {
  
  List<String> values =["Venezuela", "Afghanistan", "Vietnam"];
  
  @override
  Widget build(BuildContext context) {
    String currentValue = values.first;
    return DropdownButton(
      value: currentValue,
      onChanged: (String? value) {
        setState(() {
          currentValue = value!;
        });
      },
      items: values.map<DropdownMenuItem<String>>(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
      underline: Container(),
      dropdownColor: Colors.white,
      style: const TextStyle(color: Colors.black),
    );
  }
}
