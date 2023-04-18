import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/items/country.dart';
import 'package:messenger_app/items/dropdown_item.dart';
import 'package:messenger_app/pages/enter_phone_numb/bloc/enter_phone_number_bloc.dart';

class EnterPhoneNumberPage extends StatefulWidget {
  const EnterPhoneNumberPage({Key? key}) : super(key: key);

  @override
  State<EnterPhoneNumberPage> createState() => _EnterPhoneNumberPageState();
}

class _EnterPhoneNumberPageState extends State<EnterPhoneNumberPage> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EnterPhoneNumberBloc(),
      child: Scaffold(
        body: BlocConsumer<EnterPhoneNumberBloc, EnterPhoneNumberState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _headTextPage(),
                Column(
                  children: [
                    _phoneCountries(state.countriesPhone),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: _confirmPhoneNumber(context),
                    ),
                  ],
                ),
                _continueButton(state)
              ],
            );
          },
        ),
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

  Widget _phoneCountries(CountriesPhone? currentValue) {
    return Container(
      width: 370,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: Colors.white,
          border: Border.all(width: 1, color: const Color(0xFFDCDCDC))),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.language_outlined,
              size: 30,
            ),
          ),
          Expanded(
              child: DropDownButtonCustom(
            currentValue: currentValue,
          ))
        ],
      ),
    );
  }

  Widget _confirmPhoneNumber(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 370,
      child: TextField(
        onChanged: (value) {
          context
              .read<EnterPhoneNumberBloc>()
              .add(ChangePhoneNumberEvent(newPhoneNumber: value));
        },
        controller: textEditingController,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 0.0),
              child: Icon(Icons.call_outlined),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
      ),
    );
  }

  Widget _continueButton(EnterPhoneNumberState state) {
    return Container(
      height: 60,
      width: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: const Color(0xFF303030),
      ),
      child: InkWell(
        onTap: (() => Navigator.pushNamed(context, 'otp')),
        // onTap: () {
        //   print(state.phoneNumber);
        // },
        child: const Center(
            child: Text(
          "Continue",
          style: TextStyle(fontSize: 15, color: Colors.white),
        )),
      ),
    );
  }
}
