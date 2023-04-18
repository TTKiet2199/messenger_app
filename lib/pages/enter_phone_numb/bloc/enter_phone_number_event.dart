part of 'enter_phone_number_bloc.dart';

@immutable
abstract class EnterPhoneNumberEvent {}

class ChangeCountryPhoneEvent extends EnterPhoneNumberEvent {
  final CountriesPhone newCountriesPhone;

  ChangeCountryPhoneEvent({required this.newCountriesPhone});
}

class ChangePhoneNumberEvent extends EnterPhoneNumberEvent {
  final String newPhoneNumber;

  ChangePhoneNumberEvent({required this.newPhoneNumber});
}
