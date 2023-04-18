import 'package:bloc/bloc.dart';
import 'package:messenger_app/items/country.dart';
import 'package:meta/meta.dart';

part 'enter_phone_number_event.dart';
part 'enter_phone_number_state.dart';

class EnterPhoneNumberBloc
    extends Bloc<EnterPhoneNumberEvent, EnterPhoneNumberState> {
  EnterPhoneNumberBloc() : super(const EnterPhoneNumberState()) {
    on<EnterPhoneNumberEvent>((event, emit) {});
    on<ChangePhoneNumberEvent>(
        (event, emit) => handleChangePhoneNumberEvent(event, emit));
    on<ChangeCountryPhoneEvent>(
        (event, emit) => handleChangeCountryPhoneEvent(event, emit));
  }

  handleChangeCountryPhoneEvent(
      ChangeCountryPhoneEvent event, Emitter<EnterPhoneNumberState> emit) {
    final newState = state.copyWith(countriesPhone: event.newCountriesPhone);
    emit(newState);
  }

  handleChangePhoneNumberEvent(
      ChangePhoneNumberEvent event, Emitter<EnterPhoneNumberState> emit) {
    final newPhone = state.copyWith(phoneNumber: event.newPhoneNumber);
    emit(newPhone);
  }
}
