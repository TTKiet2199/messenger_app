import 'package:flutter/material.dart';

class AppBarItem extends StatelessWidget implements PreferredSizeWidget {
  const AppBarItem(
      {Key? key,
      required this.name,
      this.icon1,
      this.onTapButtonIcon1,
      this.icon2,
      this.onTapButtonIcon2})
      : super(key: key);
  final IconData? icon1;
  final IconData? icon2;
  final Widget name;

  final Function()? onTapButtonIcon1;
  final Function()? onTapButtonIcon2;

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: Color(0xFFDCDCDC)))),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      icon: Icon(icon1),
                      iconSize: 32,
                      onPressed: (() {
                        onTapButtonIcon1!.call();
                      }),
                    ),
                  ),
                  name
                ],
              ),
              IconButton(
                icon: Icon(icon2),
                iconSize: 32,
                onPressed: (() {
                  onTapButtonIcon2!.call();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarMess extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMess({
    Key? key,
    required this.icon1,
    required this.nameAppbar,
    required this.icon2,
    required this.image,
  }) : super(key: key);
  final IconButton icon1;
  final String nameAppbar;
  final String image;
  final IconButton icon2;
  @override
  Size get preferredSize => const Size.fromHeight(70);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: Color(0xFFDCDCDC)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon1,
            SizedBox(
              width: 300,
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            image: DecorationImage(
                                image: NetworkImage(image),
                                fit: BoxFit.cover))),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                            height: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(nameAppbar,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400)),
                                const SizedBox(
                                    height: 20,
                                    child: Text(
                                      'online',
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.lime),
                                    )),
                              ],
                            ))),
                  ]),
            ),
            icon2
          ],
        ),
      ),
    );
  }
}

class AppBarPages extends StatelessWidget implements PreferredSizeWidget {
  const AppBarPages({Key? key, required this.name, required this.size})
      : super(key: key);

  final Widget name;
  final double size;

  @override
  Size get preferredSize => Size.fromHeight(size);
  @override
  Widget build(BuildContext context) {
    return name;
  }
}
