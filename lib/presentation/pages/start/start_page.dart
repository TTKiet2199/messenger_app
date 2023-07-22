import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:messenger_app/core/app_image/app_image.dart';
import 'package:messenger_app/presentation/global_widget/items/navigator_button.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _headPageText(),
            _noteText("Let's talk with your friends and your familly whereever and whenever"),
            _imageStartPage(),
            _noteText("Have already an account"),
            const NavigatorButton(nameButton: 'Sign in here', route: 'login'),
            _noteText("Don't have an account"),
            const NavigatorButton(
              nameButton: 'Sign up here',
              route: 'name',
            )
          ],
        ),
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

  Widget _noteText(String? word) {
    return  Center(
      child: Text(
        word!,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 17, color: Color(0xFF0E9F9F)),
      ),
    );
  }
  
}
