import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jci_remit_mobile/services/api/user/models/user_dto.dart';

abstract class UserState extends Equatable {
  UserState();
}

class UserLoading extends UserState {
  UserLoading();

  @override
  List<Object> get props => [];
}

class UserSuccess extends UserState {
  final UserDto user;
  UserSuccess({@required this.user});

  @override
  List<Object> get props => [user];
}

class UserError extends UserState {
  final String message;
  UserError(this.message);

  @override
  List<Object> get props => [message];
}
