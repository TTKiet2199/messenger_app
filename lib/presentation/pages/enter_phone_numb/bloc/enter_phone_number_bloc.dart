import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger_app/core/services/firebase_service.dart';
import 'package:messenger_app/presentation/global_widget/items/country.dart';
import 'package:meta/meta.dart';

part 'enter_phone_number_event.dart';
part 'enter_phone_number_state.dart';

@injectable
class EnterPhoneNumberBloc
    extends Bloc<EnterPhoneNumberEvent, EnterPhoneNumberState> {
  EnterPhoneNumberBloc(this.firebaseService)
      : super(const EnterPhoneNumberState()) {
    on<EnterPhoneNumberEvent>((event, emit) {});
    on<ChangePhoneNumberEvent>(
        (event, emit) => handleChangePhoneNumberEvent(event, emit));
    on<ChangeCountryPhoneEvent>(
        (event, emit) => handleChangeCountryPhoneEvent(event, emit));
    on<UploadPhoneNumberAndCountryEvent>(
        (event, emit) => handleUploadPhoneNumberAndCountryEvent(event, emit));
  }
  final FirebaseService? firebaseService;
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

  handleUploadPhoneNumberAndCountryEvent(UploadPhoneNumberAndCountryEvent event,
      Emitter<EnterPhoneNumberState> emit) async {
    final bool result = await firebaseService!.uploadPhoneNumber(
        phoneNumber: state.phoneNumber!, country: state.countriesPhone!);
    final newState = state.copyWith(uploadPhoneNumberAndCountyResult: result);
    emit(newState);
  }
}
