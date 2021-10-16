import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:hcb_hackathon/auth/log_in/models/log_in_password.dart';
import 'package:hcb_hackathon/auth/log_in/models/log_in_username.dart';

class LogInState extends Equatable {
  const LogInState({
    this.status = FormzStatus.pure,
    this.username = const LogInUserName.pure(),
    this.password = const LogInPassword.pure(),
  });

  final FormzStatus status;
  final LogInUserName username;
  final LogInPassword password;

  LogInState copyWith({
    FormzStatus? status,
    LogInUserName? username,
    LogInPassword? password,
  }) {
    return LogInState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [status, username, password];
}
