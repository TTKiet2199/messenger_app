import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/injection.dart';
import 'package:messenger_app/presentation/pages/set_image/bloc/set_image_bloc.dart';

class SetImagePage extends StatefulWidget {
  const SetImagePage({Key? key}) : super(key: key);

  @override
  State<SetImagePage> createState() => _SetImagePageState();
}

class _SetImagePageState extends State<SetImagePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SetImageBloc>(),
      child: Scaffold(
        appBar: AppBar(
          shadowColor: const Color.fromARGB(0, 0, 0, 0),
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: (() {
                    Navigator.popAndPushNamed(context, 'name');
                  }),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
              const Text('3 of 3',
                  style: TextStyle(fontSize: 17, color: Color(0xFF0E9F9F))),
            ],
          ),
        ),
        body: BlocConsumer<SetImageBloc, SetImageState>(
          listener: (context, state) {
            if (state.setImageResult ?? false) {
              Navigator.pushNamed(context, 'login');
            }
          },
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      _addPhotoText(),
                      const Padding(padding: EdgeInsets.all(10)),
                      _noteText(),
                    ],
                  ),
                  _profileTmageWidget(context, state),
                  nextButton(context, state),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _addPhotoText() {
    return const Center(
      child: Text(
        "Add your photo",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _noteText() {
    return const Center(
      child: Text(
        "Get morer people to know your better",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 17, color: Color(0xFF0E9F9F)),
      ),
    );
  }

  Widget _profileTmageWidget(BuildContext context, SetImageState state) {
    var imageProvider = state.image != null
        ? FileImage(state.image!)
        : const AssetImage("assets/images/Input Image.png");
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            final file =
                await FilePicker.platform.pickFiles(type: FileType.image);
            if (file != null) {
              final image = File(file.files.first.path!);
              if (mounted) {
                context
                    .read<SetImageBloc>()
                    .add(SetImageProfileEvent(profileImage: image));
              }
            }
          },
          child: Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(140),
                image: DecorationImage(
                    fit: BoxFit.cover, image: imageProvider as ImageProvider)),
          ),
        ),
        const Center(
          child: Text(
            'Upload',
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }

  Widget nextButton(BuildContext context, SetImageState state) {
    return Container(
      height: 60,
      width: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: const Color(0xFF303030),
      ),
      child: InkWell(
          onTap: () {
            if (state.image != null) {
              context.read<SetImageBloc>().add(UploadImageEvent());
            }
          },
          child: const Center(
              child: Text('Next',
                  style: TextStyle(fontSize: 15, color: Colors.white)))),
    );
  }
}
