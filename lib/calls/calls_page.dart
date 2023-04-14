import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CallsPage extends StatefulWidget {
  const CallsPage({Key? key}) : super(key: key);

  @override
  State<CallsPage> createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage> {
  int callNum = 0;
  List<bool> callStatus = [false, true, true, false, false, true, true];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: callStatus.length,
            itemBuilder: ((context, index) {
              return Container(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [_avataImage(), _messText(),],
                ),
              );
            })),
      ),
    );
  }

  Widget _avataImage() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color.fromARGB(255, 233, 235, 235)),
      child: const Icon(Icons.person_outline_outlined),
    );
  }

  Widget _messText() {
    return SizedBox(
      width: 300,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_nameText(), _callType()],
      ),
    );
  }

  Widget _nameText() {
    return SizedBox(
        width: 170,
        height: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("User name",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400)),
            SizedBox(
              width: 150,
              height: 20,
              child: Row(
                children: [
                  callStatus[callNum] == false
                      ? const Icon(Icons.call_received)
                      : const Icon(Icons.call_made),
                  Text(
                    "${DateFormat.MMMMd().format(DateTime.now())},${DateFormat.Hm().format(DateTime.now())}",
                    textAlign: TextAlign.center,
                    style:
                        const TextStyle(fontSize: 17, color: Color(0xFF0E9F9F)),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Widget _callType() {
    return SizedBox(
        height: 50,
        width: 50,
        child: callStatus[callNum++] == false && callNum < callStatus.length
            ? const Icon(Icons.video_call)
            : const Icon(Icons.call));
  }
}
