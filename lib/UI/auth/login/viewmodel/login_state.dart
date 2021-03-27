import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  LoginState();
}

class LoginInitial extends LoginState {
  LoginInitial();

  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  LoginLoading();

  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  LoginSuccess();

  @override
  List<Object> get props => [];
}

class UserNotConfirmed extends LoginState {
  UserNotConfirmed();

  @override
  List<Object> get props => [];
}

class LoginError extends LoginState {
  final String message;
  LoginError(this.message);

  @override
  List<Object> get props => [message];
}
