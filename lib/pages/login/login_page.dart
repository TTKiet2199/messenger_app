import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _titleWidget(),
            _loginForm(),
            _loginButton(),
          ],
        )),
      ),
    );
  }

  Widget _titleWidget() {
    return const Text(
      'Sign In',
      style: TextStyle(
          color: Colors.black, fontSize: 40, fontWeight: FontWeight.w600),
    );
  }

  Widget _loginForm() {
    return SizedBox(
      height: 150,
      child: Form(
          key: _loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _emailTextField(),
              _passwordTextField(),
            ],
          )),
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      decoration: const InputDecoration(hintText: 'Email...'),
      onSaved: ((value) {
        setState(() {
          email = value;
        });
      }),
      validator: (value) {
        bool result = value!.contains(RegExp(
            r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$'));
        return result ? null : 'Please enter a valid email';
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(hintText: 'Password...'),
      onSaved: ((value) {
        setState(() {
          password = value;
        });
      }),
      validator: (value) => value!.length > 6
          ? null
          : 'Please enter a password greater than 6 character.',
    );
  }

  Widget _loginButton() {
    return InkWell(
      onTap: _loginUser,
      child: Container(
        height: 70,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.lime),
        child: const Center(
            child: Text(
          'Sign in',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }

  void _loginUser() async {
    if (_loginFormKey.currentState!.validate()) {
      _loginFormKey.currentState!.save();
      // bool result = await _firebaseService!
      //     .loginUsers(email: email!, password: password!);

      Navigator.popAndPushNamed(context, 'home');
    }
  }
}
