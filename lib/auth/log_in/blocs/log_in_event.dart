import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LogInEvent extends Equatable {
  const LogInEvent();

  @override
  List<Object?> get props => const [];
}

class LogInUsernameChanged extends LogInEvent {
  const LogInUsernameChanged({required this.username});

  final String username;

  @override
  List<Object> get props => [username];
}

class LogInPasswordChanged extends LogInEvent {
  const LogInPasswordChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class LogInSubmitted extends LogInEvent {
  final BuildContext context;

  const LogInSubmitted({required this.context});
}
