import 'package:equatable/equatable.dart';

abstract class VerifyOtpState extends Equatable {
  VerifyOtpState();
}

class VerifyOtpInitial extends VerifyOtpState {
  VerifyOtpInitial();

  @override
  List<Object> get props => [];
}

class VerifyOtpSending extends VerifyOtpState {
  VerifyOtpSending();

  @override
  List<Object> get props => [];
}

class VerifyOtpSent extends VerifyOtpState {
  VerifyOtpSent();

  @override
  List<Object> get props => [];
}

class VerifyOtpError extends VerifyOtpState {
  final String message;
  VerifyOtpError(this.message);

  @override
  List<Object> get props => [message];
}
