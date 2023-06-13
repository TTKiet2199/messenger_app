
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
               const SliverAppBar(
                backgroundColor: Colors.white,
                title: Text("Application", style: TextStyle(color: Colors.black),),
                floating: true,
                pinned: true,
                snap: true,
                bottom: TabBar(
                  labelColor: Colors.black,
                  tabs: <Tab>[
                    Tab(text: "T"),
                    Tab(text: "B"),
                  ], 
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: <Widget>[
              Center(
                  child: Text(
                'T Tab',
                style: TextStyle(fontSize: 30),
              )),
              Center(
                  child: Text(
                'B Tab',
                style: TextStyle(fontSize: 30),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
