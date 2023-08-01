import 'package:flutter/material.dart';
import 'package:messenger_app/data/models/talk_model.dart';

class MessItem extends StatefulWidget {
  const MessItem({Key? key, required this.meassage}) : super(key: key);
  final TalkModel meassage;
  @override
  State<MessItem> createState() => _TalkItemState();
}

class _TalkItemState extends State<MessItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _avataImage(),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: _messText(),
          )
        ],
      ),
    );
  }

  Widget _avataImage() {
    return Stack(alignment: Alignment.bottomRight, children: [
      Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                  image: AssetImage(widget.meassage.image!),
                  fit: BoxFit.cover))),
      widget.meassage.isOnline == IsOnline.onLine
          ? Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.green,
              ))
          : Container()
    ]);
  }

  Widget _messText() {
    return Container(
      width: 300,
      height: 80,
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 1, color: Color.fromARGB(94, 0, 0, 0)),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_nameText(), _timeSent()],
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
            Text(widget.meassage.name!,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w400)),
            SizedBox(
                width: 150,
                height: 20,
                child: widget.meassage.inbox == Inbox.recive
                    ? Text(
                        widget.meassage.messContent!,
                        style: const TextStyle(
                            fontSize: 17, color: Color(0xFF0E9F9F)),
                      )
                    : Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(
                                widget.meassage.seen == true
                                    ? Icons.done_all_outlined
                                    : Icons.check_outlined,
                                color: const Color(0xFF0E9F9F),
                              )),
                          Text(
                            widget.meassage.messContent!,
                            style: const TextStyle(
                                fontSize: 17, color: Color(0xFF0E9F9F)),
                          )
                        ],
                      ))
          ],
        ));
  }

  Widget _timeSent() {
    return SizedBox(
      height: 80,
      child: widget.meassage.isReed == false
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(widget.meassage.time!,
                    style: const TextStyle(
                        fontSize: 17, color: Color(0xFF0E9F9F))),
                Container(
                    alignment: Alignment.center,
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                    child: Text(widget.meassage.numMesUnReed!.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 15, color: Colors.white))),
              ],
            )
          : Text(widget.meassage.time!,
              style: const TextStyle(fontSize: 17, color: Color(0xFF0E9F9F))),
    );
  }
}
