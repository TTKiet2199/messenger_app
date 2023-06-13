import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'otp_page_event.dart';
part 'otp_page_state.dart';

class OtpPageBloc extends Bloc<OtpPageEvent, EnterOtpVerifyState> {
  OtpPageBloc() : super(const EnterOtpVerifyState()) {
    on<OtpPageEvent>((event, emit) {});
    on<EnterOtpVerifyEvent>(
        (event, emit) => handleEnterOtpVerifyEvent(event, emit));
  }

  handleEnterOtpVerifyEvent(
      EnterOtpVerifyEvent event, Emitter<EnterOtpVerifyState> emit) {
    final newState = state.coppyWith(otp: event.enterOtp);
    emit(newState);
  }
}
