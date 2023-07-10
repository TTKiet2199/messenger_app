import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/pages/otp/bloc/otp_page_bloc.dart';

import 'component/otp_view.dart';

class PhoneNumberVerify extends StatefulWidget {
  const PhoneNumberVerify({Key? key, this.dialCode, this.phoneNum}) : super(key: key);
  final String? phoneNum;
 final String? dialCode;
  @override
  State<PhoneNumberVerify> createState() => _PhoneNumberVerifyState();
}

class _PhoneNumberVerifyState extends State<PhoneNumberVerify> {
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpPageBloc(),
      child: Scaffold(
        body: BlocConsumer<OtpPageBloc, EnterOtpVerifyState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
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
                _enterCode(context),
                _resentCodeText(),
                _continueButton(state),
              ],
            );
          },
        ),
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
    return Center(
      child: Text(
        "We've sent the code via SMS to +${widget.dialCode} ${widget.phoneNum} ",
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 17, color: Color(0xFF0E9F9F)),
      ),
    );
  }

  Widget _enterCode(BuildContext context) {
    return const Center(
      child: OtpView()
    
    );
  }

  Widget _resentCodeText() {
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

  Widget _continueButton(EnterOtpVerifyState state) {
    return Container(
      height: 60,
      width: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: const Color(0xFF303030),
      ),
      child: InkWell(
        onTap: (
            () => Navigator.pushNamed(context, 'name')
            ) ,
        child: const Center(
            child: Text(
          "Continue",
          style: TextStyle(fontSize: 15, color: Colors.white),
        )),
      ),
    );
  }
}
