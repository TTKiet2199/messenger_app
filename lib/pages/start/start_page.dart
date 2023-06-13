import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:messenger_app/app_image/app_image.dart';
import 'package:messenger_app/items/navigator_button.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _headPageText(),
          _imageStartPage(),
          _noteText(),
          NavigatorButton(
            nameButton: 'Continue with phone',
            route: 'phone',
          )
        ],
      ),
    );
  }

  Widget _headPageText() {
    return const Center(
        child: Text(
      "What's up",
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
    ));
  }

  Widget _imageStartPage() {
    return Center(
      child: SvgPicture.asset(AppImage.loginImage),
    );
  }

  Widget _noteText() {
    return const Center(
      child: Text(
        "Let's talk with your friends and your familly whereever and whenever ",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 17, color: Color(0xFF0E9F9F)),
      ),
    );
  }
}
