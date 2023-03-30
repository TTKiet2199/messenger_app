import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberVerify extends StatefulWidget {
  const PhoneNumberVerify({Key? key, }) : super(key: key);
// required this.phoneNum
  @override
  State<PhoneNumberVerify> createState() => _PhoneNumberVerifyState();
  // PhoneNumber? phoneNum;
}

class _PhoneNumberVerifyState extends State<PhoneNumberVerify> {
  int? otp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              _enterCodeText(),
              const Padding(padding: EdgeInsets.all(10)),
              _confirmText(),
            ],
          ),
          _enterCode(),
          _resenCodeText()
        ],
      ),
    );
  }

  Widget _enterCodeText() {
    return const Center(
      child: Text(
        "Enter code",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _confirmText() {
    return const Center(
      child: Text(
        "We've sent the code via SMS to  ",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 17, color: Color(0xFF0E9F9F)),
      ),
    );
  }

  Widget _enterCode() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            4,
            (index) => SizedBox(
                  height: 70,
                  width: 70,
                  child: TextField(
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    textAlignVertical: TextAlignVertical.center,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [LengthLimitingTextInputFormatter(1)],
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                )),
      ),
    );
  }

  Widget _resenCodeText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Didn't get the code?",
          style: TextStyle(fontSize: 17, color: Color(0xFF0E9F9F)),
        ),
        GestureDetector(
          onTap: (() {}),
          child: const Text(
            "Resent code",
            style: TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}
