part of 'enter_phone_number_bloc.dart';

@immutable
class EnterPhoneNumberState {
  final String? phoneNumber;
  final CountriesPhone? countriesPhone;
  final bool? uploadPhoneNumberAndCountyResult;

  const EnterPhoneNumberState({
    this.uploadPhoneNumberAndCountyResult,
    this.phoneNumber,
    this.countriesPhone,
  });

  EnterPhoneNumberState copyWith(
          {String? phoneNumber,
          CountriesPhone? countriesPhone,
          bool? uploadPhoneNumberAndCountyResult}) =>
      EnterPhoneNumberState(
          countriesPhone: countriesPhone ?? this.countriesPhone,
          phoneNumber: phoneNumber ?? this.phoneNumber,
          uploadPhoneNumberAndCountyResult: uploadPhoneNumberAndCountyResult ??
              this.uploadPhoneNumberAndCountyResult);
}
