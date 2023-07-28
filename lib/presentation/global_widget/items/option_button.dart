import 'package:flutter/material.dart';

class OptionButton extends StatefulWidget {
  const OptionButton({
    Key? key,
    required this.height,
    required this.nameOption,
    required this.iconOption,
    required this.route,
    required this.widthSide,
  }) : super(key: key);
  @override
  State<OptionButton> createState() => _OptionButtonState();
 final List<String> nameOption ;
 final List<String> route ;
 final List<IconData> iconOption;
 final double height, widthSide;
}

class _OptionButtonState extends State<OptionButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(
            width: widget.widthSide, color: const Color.fromARGB(22, 0, 0, 0)),
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
          children: List.generate(
              widget.nameOption.length,
              (index) => InkWell(
                    onTap: (() =>
                        Navigator.pushNamed(context, widget.route[index])),
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      width: 410,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: index == widget.nameOption.length - 1
                              ? const BorderSide(color: Colors.transparent)
                              : const BorderSide(
                                  width: 1, color: Color.fromARGB(30, 0, 0, 0)),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            widget.iconOption[index],
                            size: 35,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              widget.nameOption[index],
                              style: const TextStyle(fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                  ))),
    );
  }
}
