import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/pages/otp/bloc/otp_page_bloc.dart';

import 'item_otp_textfield.dart';

class OtpView extends StatefulWidget {
  const OtpView({Key? key, this.otpLength = 4}) : super(key: key);
  final int otpLength;

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  late List<TextEditingController> controllers;

  @override
  void initState() {
    super.initState();
    controllers =
        List.generate(widget.otpLength, (index) => TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          widget.otpLength,
          (index) => ItemOtpTextField(
                controller: controllers[index],
                onChange: () {
                  _updateData();
                },
              )),
    );
  }

  void _updateData() {
    final otp = controllers.map((e) => e.text).join();
    context.read<OtpPageBloc>().add(EnterOtpVerifyEvent(enterOtp: otp));
  }
}
