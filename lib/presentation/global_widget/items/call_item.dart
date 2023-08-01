import 'package:flutter/material.dart';
import 'package:messenger_app/data/models/call_model.dart';

class CallItem extends StatefulWidget {
  const CallItem({Key? key, required this.call}) : super(key: key);
  final CallModel call;
  @override
  State<CallItem> createState() => _CallItemState();
}

class _CallItemState extends State<CallItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              _avataImage(),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: _nameText(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: _callType(),
          ),
        ],
      ),
    );
  }

  Widget _avataImage() {
    return Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            image: DecorationImage(
                image: AssetImage(widget.call.ava!), fit: BoxFit.cover)));
  }

  Widget _nameText() {
    return SizedBox(
        height: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.call.name!,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w400)),
            SizedBox(
              height: 20,
              child: Row(
                children: [
                  widget.call.isIncomming == false
                      ? const Icon(Icons.call_received)
                      : const Icon(Icons.call_made),
                  Text(
                    widget.call.time!,
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
        child: widget.call.callType == CallType.video
            ? const Icon(Icons.videocam_outlined)
            : const Icon(Icons.call));
  }
}
