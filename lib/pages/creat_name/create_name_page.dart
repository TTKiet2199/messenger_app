import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/pages/creat_name/bloc/create_name_bloc.dart';

class CreateNamePage extends StatefulWidget {
  const CreateNamePage({Key? key}) : super(key: key);

  @override
  State<CreateNamePage> createState() => _CreateNamePageState();
}

class _CreateNamePageState extends State<CreateNamePage> {
  TextEditingController textEditingController = TextEditingController();
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      children: [
                        _createNameText(),
                        const Padding(padding: EdgeInsets.all(10)),
                        _noteText(),
                      ],
                    ),
                    _enterNameTextFiled(context),
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

  Widget _createNameText() {
    return const Center(
      child: Text(
        "Create your name",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _noteText() {
    return const Center(
      child: Text(
        "Get morer people to know your name ",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 17, color: Color(0xFF0E9F9F)),
      ),
    );
  }

  Widget _enterNameTextFiled(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 370,
      child: TextField(
        onChanged: (value) {
          context
              .read<CreateNameBloc>()
              .add(CreatYourNameEvent(createYourName: value));
        },
        controller: textEditingController,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 0.0),
              child: Icon(Icons.person),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
      ),
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
        onTap: (() {
          print(state.createName);
          Navigator.pushNamed(context, 'image');
        }),
        child: const Center(
            child: Text(
          "Continue",
          style: TextStyle(fontSize: 15, color: Colors.white),
        )),
      ),
    );
  }
}
