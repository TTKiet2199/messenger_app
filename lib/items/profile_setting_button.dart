import 'package:flutter/material.dart';

class ProfileSettingButton extends StatefulWidget {
  ProfileSettingButton({
    Key? key,
    required this.nameOption,
    required this.iconOption,
    required this.underText
  }) : super(key: key);
  List<String> nameOption = [];
  List<String> underText = [];
  List<IconData> iconOption = [];

  @override
  State<ProfileSettingButton> createState() => _ProfileSettingButtonState();
}

class _ProfileSettingButtonState extends State<ProfileSettingButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            widget.nameOption.length,
            (index) => Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 410,
                  height: 75,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: index == 2
                          ? const BorderSide(
                              color: Color.fromARGB(30, 245, 241, 241))
                          : const BorderSide(
                              width: 1, color: Color.fromARGB(30, 0, 0, 0)),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            widget.iconOption[index],
                            size: 35,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.nameOption[index],
                                    style: const TextStyle(
                                        fontSize: 25,
                                        )),
                                SizedBox(
                                  height: 20,
                                  child: Text(
                                    widget.underText[index],
                                    style: const TextStyle(
                                        fontSize: 17, color: Color(0xFF9E9F9F)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      index < 2
                          ? const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Icon(Icons.border_color_outlined),
                            )
                          : Container()
                    ],
                  ),
                )));
  }

  
}
