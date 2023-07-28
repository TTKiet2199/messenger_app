import 'package:flutter/material.dart';
import 'package:messenger_app/data/models/mess_model.dart';

class AppBarAll extends StatelessWidget implements PreferredSizeWidget {
  const AppBarAll(
      {Key? key,
      required this.name,
      required this.icon1,
      required this.onTapButtonBack,
      required this.icon2,
      required this.route2})
      : super(key: key);
  final IconData icon1;
  final IconData? icon2;
  final Widget name;
  final String? route2;

  final Function() onTapButtonBack;

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
                        onTapButtonBack.call();
                       
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
                  Navigator.popAndPushNamed(context, route2!);
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
  }) : super(key: key);
  final IconButton icon1;
  final MessObject nameAppbar;
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
                                image: AssetImage(nameAppbar.image!),
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
                                Text(nameAppbar.name!,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400)),
                                SizedBox(
                                  height: 20,
                                  child: nameAppbar.isOnline == IsOnline.onLine
                                      ? const Text(
                                          'online',
                                          style: TextStyle(
                                              fontSize: 17, color: Colors.lime),
                                        )
                                      : const Text(
                                          'offline',
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Color(0xFF9E9F9F)),
                                        ),
                                ),
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
