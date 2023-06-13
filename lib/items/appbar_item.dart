import 'package:flutter/material.dart';
class AppBarAll extends StatelessWidget implements PreferredSizeWidget {
  const AppBarAll(
      {Key? key,
      required this.name,
      required this.icon1,
      required this.route1,
      required this.icon2,
      required this.route2})
      : super(key: key);
 final IconData icon1; 
 final  IconData? icon2;
 final String name, route1;
 final String? route2;

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 1, color:Color(0xFFDCDCDC)))),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
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
                          Navigator.popAndPushNamed(context, route1);
                        }),
                      ),
                    ),
                    Text(name,
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.black))
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
            )
          ],
        ),
      ),
    );
  }
}
