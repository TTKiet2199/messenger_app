part of 'enter_phone_number_bloc.dart';

@immutable
class EnterPhoneNumberState {
  final String? phoneNumber;
  final CountriesPhone? countriesPhone;

  const EnterPhoneNumberState({this.phoneNumber, this.countriesPhone});

  EnterPhoneNumberState copyWith(
          {String? phoneNumber, CountriesPhone? countriesPhone}) =>
      EnterPhoneNumberState(
          countriesPhone: countriesPhone ?? this.countriesPhone,
          phoneNumber: phoneNumber ?? this.phoneNumber);
}

