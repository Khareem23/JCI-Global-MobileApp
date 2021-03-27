import 'package:equatable/equatable.dart';

abstract class MobileAuthState extends Equatable {
  MobileAuthState();
}

class MobileAuthInitial extends MobileAuthState {
  MobileAuthInitial();

  @override
  List<Object> get props => [];
}

class MobileAuthSending extends MobileAuthState {
  MobileAuthSending();

  @override
  List<Object> get props => [];
}

class MobileAuthSent extends MobileAuthState {
  MobileAuthSent();

  @override
  List<Object> get props => [];
}

class MobileAuthError extends MobileAuthState {
  final String message;
  MobileAuthError(this.message);

  @override
  List<Object> get props => [message];
}
