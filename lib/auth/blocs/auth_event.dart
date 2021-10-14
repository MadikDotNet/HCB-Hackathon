import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => const [];
}

class AppStartedEvent extends AuthEvent {
  const AppStartedEvent();
}

class LoggedInEvent extends AuthEvent {
  final String token;

  const LoggedInEvent({required this.token});

  @override
  List<Object?> get props => [token];

  @override
  String toString() => 'LoggedIn { token: "$token" }';
}

class LoggedOutEvent extends AuthEvent {
  const LoggedOutEvent();

  @override
  String toString() => 'LoggedOut';
}
