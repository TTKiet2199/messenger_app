import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/core/app_image/app_image.dart';
import 'package:messenger_app/data/models/profile_model.dart';
import 'package:messenger_app/injection.dart';
import 'package:messenger_app/presentation/global_widget/items/option_button.dart';
import 'package:messenger_app/presentation/pages/my_profile/my_profile_page.dart';
import 'package:messenger_app/presentation/pages/profile/bloc/profile_bloc.dart';

import '../../global_widget/items/appbar_item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileBloc>()..add(GetProfileEvent()),
      child: Scaffold(
          appBar: AppBarPages(
            size: 160,
            name: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Text("Profile",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
            ),
          ),
          body: BlocConsumer<ProfileBloc, ProfileState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Column(
                children: [
                  _profileItem(context, state),
                  _settingsButton(),
                  _helpButton()
                ],
              );
            },
          )),
    );
  }

  Widget _profileItem(BuildContext context, ProfileState state) {
    return Container(
        height: 90,
        decoration: const BoxDecoration(
            border: Border(
          bottom: BorderSide(width: 1, color: Color.fromARGB(22, 0, 0, 0)),
        )),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MyProfile(
                profileName: state.mainProfile!.name,
                profileImage: state.mainProfile!.image,
                profilePhoneNumber: state.mainProfile!.phoneNum,
              ),
            ));
            context.read<ProfileBloc>().add(GetProfileEvent());
          },
          child: Row(
            children: [
              Container(
                  margin: const EdgeInsets.all(10),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      border: const Border(
                        top: BorderSide(width: 1),
                        bottom: BorderSide(width: 1),
                        left: BorderSide(width: 1),
                        right: BorderSide(width: 1),
                      ),
                      image: DecorationImage(
                        image: (NetworkImage(
                            ((state.mainProfile ?? ProfileModel()).image ??
                                AppImage.defaultImage))),
                      ))),
              Text((state.mainProfile ?? ProfileModel()).name ?? '',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w400))
            ],
          ),
        ));
  }

  Widget _settingsButton() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20, top: 10),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Settings',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        const OptionButton(
            height: 260,
            nameOption: [
              'Notifications',
              'Privacy anh Security',
              'Chats',
              "Storage and Data"
            ],
            iconOption: [
              Icons.notifications_none_outlined,
              Icons.lock_outlined,
              Icons.messenger_outline_outlined,
              Icons.pie_chart_outline
            ],
            route: ['noti', 'private', 'chat', 'storage'],
            widthSide: 10)
      ],
    );
  }

  Widget _helpButton() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20, top: 10),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Help',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        const OptionButton(
            height: 260,
            nameOption: [
              "What's Up FAQ",
              'Privacy policy',
              'Ask a question',
              'Sign Out'
            ],
            iconOption: [
              Icons.question_mark_outlined,
              Icons.shield_outlined,
              Icons.message_outlined,
              Icons.logout_outlined,
            ],
            route: ['faq', 'policy', 'ask', 'start'],
            widthSide: 0)
      ],
    );
  }
}
