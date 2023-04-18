import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/items/country.dart';

import '../pages/enter_phone_numb/bloc/enter_phone_number_bloc.dart';

class DropDownButtonCustom extends StatefulWidget {
  const DropDownButtonCustom({Key? key, this.currentValue}) : super(key: key);
  final CountriesPhone? currentValue;

  @override
  State<DropDownButtonCustom> createState() => _DropDownButtonCustomState();
}

class _DropDownButtonCustomState extends State<DropDownButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<CountriesPhone>(
      isExpanded: true,
      value: widget.currentValue ?? countries.first,
      onChanged: (CountriesPhone? value) {
        context.read<EnterPhoneNumberBloc>().add(ChangeCountryPhoneEvent(newCountriesPhone: value ?? countries.first));
      },
      items: countries.map<DropdownMenuItem<CountriesPhone>>(
        (CountriesPhone value) {
          return DropdownMenuItem<CountriesPhone>(
            value: value,
            child: Text(
              "(+${value.dialCode.toString()})${value.name.toString()}",
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
      ).toList(),
      underline: Container(),
      dropdownColor: Colors.white,
      style: const TextStyle(color: Colors.black),
    );
  }
}
