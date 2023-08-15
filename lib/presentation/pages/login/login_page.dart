import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/injection.dart';
import 'package:messenger_app/presentation/pages/login/bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController.text = 'kiet1@gmail.com';
    passwordController.text = '1234567';
  }

  @override
  void dispose() {
    super.dispose();
    emailController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context1) => getIt<LoginBloc>(),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state.loginResult ?? false) {
                Navigator.pushNamed(context, 'home');
              }
            },
            builder: (context, state) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _titleWidget(),
                  _loginForm(context),
                  _loginButton(context),
                ],
              ));
            },
          ),
        ),
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

  Widget _loginForm(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Form(
          key: _loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _emailTextField(context),
              _passwordTextField(context),
            ],
          )),
    );
  }

  Widget _emailTextField(BuildContext context) {
    return TextFormField(
      controller: emailController,
      onChanged: (value) {
        context.read<LoginBloc>().add(EnterYourEmailEvent(enterEmail: value));
      },
      decoration: const InputDecoration(
          hintText: 'Email...',
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 0),
            child: Icon(Icons.email_outlined),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(60)))),
      validator: (value) {
        bool result = value!.contains(RegExp(
            r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$'));
        return result ? null : 'Please enter a valid email';
      },
    );
  }

  Widget _passwordTextField(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      onChanged: (value1) {
        context
            .read<LoginBloc>()
            .add(EnterYourPasswordEvent(enterPassword: value1));
      },
      obscureText: true,
      decoration: const InputDecoration(
          hintText: 'Password...',
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 0),
            child: Icon(Icons.password_outlined),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(60)))),
      validator: (value) => value!.length > 6
          ? null
          : 'Please enter a password greater than 6 character.',
    );
  }

  Widget _loginButton(BuildContext context) {
    return InkWell(
      onTap: () {
        if (_loginFormKey.currentState!.validate()) {
          context.read<LoginBloc>().add(LoginEvent());
        }
      },
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
}
