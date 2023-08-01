import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/injection.dart';
import 'package:messenger_app/presentation/global_widget/items/country.dart';
import 'package:messenger_app/presentation/global_widget/items/dropdown_item.dart';

import 'bloc/enter_phone_number_bloc.dart';

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
      create: (context) => getIt<EnterPhoneNumberBloc>(),
      child: Scaffold(
        appBar: AppBar(
          shadowColor: const Color.fromARGB(0, 0, 0, 0),
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          title: Container(
            alignment: Alignment.centerRight,
            child: const Text('2 of 3',
                style: TextStyle(fontSize: 17, color: Color(0xFF0E9F9F))),
          ),
        ),
        body: BlocConsumer<EnterPhoneNumberBloc, EnterPhoneNumberState>(
          listener: (context, state) {
            if (state.uploadPhoneNumberAndCountyResult ?? false) {
              Navigator.pushNamed(context, 'image');
            }
          },
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
                _continueButton(state, context)
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _headTextPage() {
    return const SizedBox(
      height: 100,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
            hintText: 'Phone Number',
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 0.0),
              child: Icon(Icons.call_outlined),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
      ),
    );
  }

  Widget _continueButton(EnterPhoneNumberState state, BuildContext context) {
    return Container(
      height: 60,
      width: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: const Color(0xFF303030),
      ),
      child: InkWell(
        onTap: () {
          if (state.phoneNumber != null) {
            context
                .read<EnterPhoneNumberBloc>()
                .add(UploadPhoneNumberAndCountryEvent());
          }
        },
        child: const Center(
            child: Text(
          "Continue",
          style: TextStyle(fontSize: 15, color: Colors.white),
        )),
      ),
    );
  }
}
