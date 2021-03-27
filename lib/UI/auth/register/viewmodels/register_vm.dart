import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  RegisterState();
}

class RegisterInitial extends RegisterState {
  RegisterInitial();

  @override
  List<Object> get props => [];
}

class RegisterLoading extends RegisterState {
  RegisterLoading();

  @override
  List<Object> get props => [];
}

class RegisterSuccess extends RegisterState {
  RegisterSuccess();

  @override
  List<Object> get props => [];
}

class RegisterError extends RegisterState {
  final String message;
  RegisterError(this.message);

  @override
  List<Object> get props => [message];
}
