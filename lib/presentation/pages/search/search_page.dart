import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/presentation/global_widget/items/appbar_item.dart';

import 'bloc/search_page_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

List<String> nameButton = [
  'Chats',
  'Photos',
  'Videos',
  'Audio',
  'Link',
  'Document'
];
List<Icon> iconButton = const [
  Icon(Icons.chat_bubble_outline_outlined),
  Icon(Icons.photo),
  Icon(Icons.videocam_outlined),
  Icon(Icons.headphones),
  Icon(Icons.link),
  Icon(Icons.feed_outlined),
];

class _SearchPageState extends State<SearchPage> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchPageBloc(),
      child: BlocConsumer<SearchPageBloc, SearchPageState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBarPages(
                size: 70,
                name: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: Color(0xFFDCDCDC)))),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 200,
                        child: TextField(
                            controller: textEditingController,
                            onChanged: (value) {
                              context
                                  .read<SearchPageBloc>()
                                  .add(ResultSearchEvent(resultSearch: value));
                            },
                            decoration: const InputDecoration(
                              hintText: 'Search...',
                              hintStyle:
                                  TextStyle(fontSize: 20, color: Color(0xFF0E9F9F)),
                              border: InputBorder.none,
                            )),
                      ),
                    ],
                  ),
                ),
                ],
              ),
            ),
          ),
                
              ),
              body: Column(
                children: [
                  _listButton(),
                  _recentSearchWidget(),
                  _listRecentSearch(state)
                ],
              ));
        },
      ),
    );
  }

  Widget _listButton() {
    return Container(
        height: 80,
        decoration: const BoxDecoration(
            border: Border(
                bottom:
                    BorderSide(width: 1, color: Color.fromARGB(94, 0, 0, 0)))),
        child: Container(
            padding: const EdgeInsets.all(5),
            height: 40,
            child: _buttonWidget()));
  }

  Widget _buttonWidget() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: nameButton.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color.fromARGB(255, 233, 235, 235)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [iconButton[index], Text(nameButton[index])]),
          ),
        );
      },
    );
  }

  Widget _recentSearchWidget() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            'Resent searches',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          GestureDetector(
            onTap: (() {}),
            child: const Text(
              "Clear all",
              style: TextStyle(
                color: Color(0xFF0E9F9F),
                fontSize: 17,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _listRecentSearch(SearchPageState state) {
    return Expanded(
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: ListView.builder(
              itemCount: state.search == null ? 0 : state.search!.length,
              itemBuilder: ((context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Icon(Icons.search),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: 320,
                      height: 20,
                      child: Text(
                        state.search!,
                        style: const TextStyle(
                          color: Color(0xFF0E9F9F),
                          fontSize: 17,
                        ),
                      ),
                    ),
                    GestureDetector(
                        child: const Icon(
                      Icons.cancel_sharp,
                      color: Colors.black,
                    ))
                  ],
                );
              }))),
    );
  }
}
