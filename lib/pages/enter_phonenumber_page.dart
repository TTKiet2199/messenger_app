import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class EnterPhoneNumberPage extends StatefulWidget {
  const EnterPhoneNumberPage({Key? key}) : super(key: key);

  @override
  State<EnterPhoneNumberPage> createState() => _EnterPhoneNumberPageState();
}

class _EnterPhoneNumberPageState extends State<EnterPhoneNumberPage> {
  PhoneNumber? phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_headTextPage(), _confirmPhoneNumber(), _continueButton()],
      ),
    );
  }

  Widget _headTextPage() {
    return SizedBox(
      height: 100,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Enter your phone number",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            Text(
              "Please confirm your region and enter your phone number",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17, color: Color(0xFF0E9F9F)),
            )
          ],
        ),
      ),
    );
  }

  Widget _confirmPhoneNumber() {
    return IntlPhoneField(
      decoration: const InputDecoration(
        labelText: 'Phone Number',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
      initialCountryCode: 'VN',
      onSaved: (value) {
        setState(() {
          phoneNumber = value;
        });
      },
    );
  }

  Widget _continueButton() {
    return Container(
      height: 60,
      width: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: const Color(0xFF303030),
      ),
      child: InkWell(
        onTap: (() => Navigator.pushNamed(context, 'otp')),
        child: const Center(
            child: Text(
          "Continue",
          style: TextStyle(fontSize: 15, color: Colors.white),
        )),
      ),
    );
  }
}
