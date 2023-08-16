import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/core/services/firebase_options.dart';
import 'package:messenger_app/injection.dart';
import 'package:messenger_app/presentation/pages/calls/select_contact/select_contact_page.dart';
import 'package:messenger_app/presentation/pages/contacts/add_contact/add_contact_page.dart';
import 'package:messenger_app/presentation/pages/contacts/add_contact/fine_and_invite/fine_people_nearby_page.dart';
import 'package:messenger_app/presentation/pages/contacts/add_contact/fine_and_invite/invite_friends_page.dart';
import 'package:messenger_app/presentation/pages/creat_name/create_name_page.dart';
import 'package:messenger_app/presentation/pages/enter_phone_numb/enter_phonenumber_page.dart';
import 'package:messenger_app/presentation/pages/group/group_setting/group_setting_page.dart';
import 'package:messenger_app/presentation/pages/group/new_group_page.dart';
import 'package:messenger_app/presentation/pages/home/home_page.dart';
import 'package:messenger_app/presentation/pages/login/login_page.dart';
import 'package:messenger_app/presentation/pages/messages/channel_page.dart';
import 'package:messenger_app/presentation/pages/messages/chat/chat_page.dart';
import 'package:messenger_app/presentation/pages/new_messenger/new_mess_page.dart';
import 'package:messenger_app/presentation/pages/otp/otp_page.dart';
import 'package:messenger_app/presentation/pages/my_profile/my_profile_page.dart';
import 'package:messenger_app/presentation/pages/user_profile/user_profile.dart';
import 'package:messenger_app/presentation/pages/search/search_page.dart';
import 'package:messenger_app/presentation/pages/set_image/set_image_page.dart';
import 'presentation/pages/start/start_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Messenger App',
      initialRoute: 'start',
      routes: {
        'start': (context) => const StartPage(),
        'login': (context) => const LoginPage(),
        'phone': (context) => const EnterPhoneNumberPage(),
        'otp': (context) => const PhoneNumberVerify(),
        'name': (context) => const CreateNamePage(),
        'image': (context) => const SetImagePage(),
        'home': (context) => const HomePage(),
        'search': (context) => const SearchPage(),
        'newMess': (context) => const NewMessagesPage(),
        'newGroup': (context) => const NewGroupPage(),
        'settingGroup': (context) => const GroupSettingPage(),
        'invite': (context) => const InviteFriendsPage(),
        'channel': (context) => const ChannelPage(),
        'find': (context) => const FindPeopleNearbyPage(),
        'profile': (context) => const MyProfile(),
        'selectCall': (context) => const SelectContactPage(),
        'addContact': (context) => const AddContactPage(),
        'userProfile': (context) => const UserProfilePage(),
        'chat': (context) => const ChatPages(),
      },
    );
  }
}
