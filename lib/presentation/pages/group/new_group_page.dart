import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/injection.dart';
import 'package:messenger_app/presentation/global_widget/items/appbar_item.dart';
import 'package:messenger_app/presentation/global_widget/items/item_chip_user.dart';
import 'package:messenger_app/presentation/pages/group/bloc/new_group_bloc.dart';

class NewGroupPage extends StatefulWidget {
  const NewGroupPage({Key? key}) : super(key: key);

  @override
  State<NewGroupPage> createState() => _NewGroupPageState();
}

class _NewGroupPageState extends State<NewGroupPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NewGroupBloc>()..add(GetMemberListEvent()),
      child: Scaffold(
        appBar: AppBarItem(
          icon1: Icons.arrow_back,
          icon2: Icons.search,
          name: const Text('New group',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
          onTapButtonIcon1: () {
            Navigator.pop(context, 'newMes');
          },
          onTapButtonIcon2: () {
            Navigator.pushNamed(context, "search");
          },
        ),
        body: BlocConsumer<NewGroupBloc, NewGroupState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Stack(children: [
              Column(
                children: [
                  _groupMemberSelected(state),
                  Expanded(child: memberList(state))
                ],
              ),
              Container(
                  padding: const EdgeInsets.only(bottom: 30),
                  alignment: Alignment.bottomCenter,
                  child: _nextButton())
            ]);
          },
        ),
      ),
    );
  }

  Widget _groupMemberSelected(NewGroupState state) {
    return Container(
      margin: const EdgeInsets.all( 20),
      height: 120,
      decoration: const BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 1, color: Color.fromARGB(22, 0, 0, 0)))),
      child: ListView(children: [
        Wrap(
          spacing: 5,
          runSpacing: 5,
          children: List.generate(
            (state.listMember??[]).length,
            (index) =>
                ItemChipUser(name: (state.listMember ?? [])[index].userName!),
          ),
        ),
      ]),
    );
  }

  Widget memberList(NewGroupState state) {
    return ListView.builder(
      itemCount: (state.listMember ?? []).length,
      itemBuilder: (BuildContext context, int index) {
        final member = (state.listMember ?? [])[index];
        return Row(
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
                  image: DecorationImage(image: NetworkImage(member.ava!))),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(member.userName!,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 20,
                  child: Text(
                    'last active at ${member.timeSeen}',
                    style:
                        const TextStyle(fontSize: 17, color: Color(0xFF9E9F9F)),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  Widget _nextButton() {
    return Container(
      height: 60,
      width: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: const Color(0xFF303030),
      ),
      child: InkWell(
        onTap: (() => Navigator.pushNamed(context, 'settingGroup')),
        child: const Center(
            child: Text(
          "Next",
          style: TextStyle(fontSize: 15, color: Colors.white),
        )),
      ),
    );
  }
}
