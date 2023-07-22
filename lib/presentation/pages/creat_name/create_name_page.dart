import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:messenger_app/presentation/pages/creat_name/bloc/create_name_bloc.dart';

import '../../../core/services/firebase_service.dart';




class CreateNamePage extends StatefulWidget {
  const CreateNamePage({Key? key}) : super(key: key);

  @override
  State<CreateNamePage> createState() => _CreateNamePageState();
}

class _CreateNamePageState extends State<CreateNamePage> {
  final GlobalKey<FormState> infomationFormKey = GlobalKey<FormState>();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  FirebaseService? _firebaseService;
  String? name, email, password;
  @override
  void initState() {
    super.initState();
    _firebaseService = GetIt.instance.get<FirebaseService>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateNameBloc(),
      child: Scaffold(
        appBar: AppBar(
          shadowColor: const Color.fromARGB(0, 0, 0, 0),
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          title: Container(
            alignment: Alignment.centerRight,
            child: const Text('1 of 2',
                style: TextStyle(fontSize: 17, color: Color(0xFF0E9F9F))),
          ),
        ),
        body: BlocConsumer<CreateNameBloc, CreateNameState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SafeArea(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      children: [
                        _nameText(),
                        const Padding(padding: EdgeInsets.all(10)),
                        _noteText(),
                      ],
                    ),
                    _infomationForm(context),
                    _continueButton(state)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _nameText() {
    return const Center(
      child: Text(
        "Create your infomation",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _noteText() {
    return const Center(
      child: Text(
        "Get more people to know your name ",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 17, color: Color(0xFF0E9F9F)),
      ),
    );
  }

  Widget _infomationForm(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Form(
          key: infomationFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              _createNameText(context),
              _createEmailText(context),
              _createPasswordText(context)
            ],
          )),
    );
  }

  Widget _createNameText(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        context
            .read<CreateNameBloc>()
            .add(CreatYourNameEvent(createYourName: value));
      },
      decoration: const InputDecoration(
          hintText: 'Name....',
          prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 0),
                    child:Icon(Icons.person_outlined) ,),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(60)))),
      validator: (value) => value!.isNotEmpty ? null : 'Please enter a name',
      onSaved: (value) {
        setState(() {
          name = value;
        });
      },
    );
  }

  Widget _createEmailText(BuildContext context) {
    return TextFormField(
      onChanged: (value1) {
        context
            .read<CreateNameBloc>()
            .add(CreateYourEmailEvent(createYouremail: value1));
      },
      decoration: const InputDecoration(
          hintText: 'Email...',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(60))),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 0),
            child: Icon(Icons.email_outlined),
          )),
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

  Widget _createPasswordText(BuildContext context) {
    return TextFormField(
      onChanged: (value2) {
        context
            .read<CreateNameBloc>()
            .add(CreateYourPasswordEvent(createYourPassword: value2));
      },
      obscureText: true,
      decoration: const InputDecoration(
          hintText: 'Password...',
          prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 0),
                    child:Icon(Icons.password_outlined) ,),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(60)))),
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

  Widget _continueButton(CreateNameState state) {
    return Container(
      height: 60,
      width: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: const Color(0xFF303030),
      ),
      child: InkWell(
        onTap: () {
          register(state);
        },
        //  (){
        //   print(state.createEmail);
        //   print(state.createName);
        //   print(state.createPassword);
        // },
        child: const Center(
            child: Text(
          "Continue",
          style: TextStyle(fontSize: 15, color: Colors.white),
        )),
      ),
    );
  }

  void register(CreateNameState state) async {
    if (infomationFormKey.currentState!.validate()) {
      infomationFormKey.currentState!.save();
      bool result = await _firebaseService!.registerUser(
          name: state.createName!,
          email: state.createEmail!,
          password: state.createPassword!);

      if (result) {
        Navigator.pushNamed(context, 'login');
      }
    }
  }
}
