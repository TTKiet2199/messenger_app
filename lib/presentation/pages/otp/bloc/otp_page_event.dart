part of 'otp_page_bloc.dart';

@immutable
abstract class OtpPageEvent {}

class EnterOtpVerifyEvent extends OtpPageEvent {
  final String enterOtp;

  EnterOtpVerifyEvent({required this.enterOtp});
}
