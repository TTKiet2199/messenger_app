
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:messenger_app/app_image/app_image.dart';

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
        children: [_headPageText(), _imageStartPage(), _noteText(),_enterPhonenumberButton()],
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
      child: SvgPicture.asset(
          AppImage.loginImage),
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

  Widget _enterPhonenumberButton() {
    return Container(
      height: 60,
      width: 360,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(60),
      color: const Color(0xFF303030),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, 'phone'),
        child: const Center(
            child: Text(
          "Continue with phone",
          style: TextStyle(fontSize: 15, color: Colors.white),
        )),
      ),
    );
  }
}
