import 'package:equatable/equatable.dart';
import 'package:jci_remit_mobile/services/api/user/models/user_dto.dart';

abstract class AuthState extends Equatable {
  AuthState();
}

class AuthUnauthenticated extends AuthState {
  AuthUnauthenticated();

  @override
  List<Object> get props => [];
}

class AuthUnknown extends AuthState {
  AuthUnknown();

  @override
  List<Object> get props => [];
}

class AuthNotVerified extends AuthState {
  AuthNotVerified();

  @override
  List<Object> get props => [];
}

class AuthPinNeeded extends AuthState {
  AuthPinNeeded();

  @override
  List<Object> get props => [];
}

class AuthAuthenticated extends AuthState {
  final UserDto user;
  AuthAuthenticated(this.user);

  @override
  List<Object> get props => [user];
}
