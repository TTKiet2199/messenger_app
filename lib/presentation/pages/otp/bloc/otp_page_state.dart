part of 'otp_page_bloc.dart';

@immutable
class EnterOtpVerifyState {
  final String? otp;

  const EnterOtpVerifyState({this.otp});

  EnterOtpVerifyState coppyWith({String? otp}) =>
      EnterOtpVerifyState(otp: otp ?? this.otp);
}
