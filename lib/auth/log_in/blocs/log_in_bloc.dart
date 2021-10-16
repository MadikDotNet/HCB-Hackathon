import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:hcb_hackathon/auth/blocs/auth_event.dart';
import 'package:hcb_hackathon/auth/blocs/bloc_auth.dart';
import 'package:hcb_hackathon/auth/data/auth_repository.dart';
import 'package:hcb_hackathon/auth/log_in/models/log_in_password.dart';
import 'package:hcb_hackathon/auth/log_in/models/log_in_username.dart';
import 'package:hcb_hackathon/auth/log_in/views/alert_dialogs.dart';
import 'package:injectable/injectable.dart';

import 'log_in_event.dart';
import 'log_in_state.dart';

@injectable
class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final AuthBloc authBloc;
  final AuthRepository authenticationRepository;

  LogInBloc({
    required this.authBloc,
    required this.authenticationRepository,
  }) : super(const LogInState());

  @override
  Stream<LogInState> mapEventToState(LogInEvent event) async* {
    if (event is LogInUsernameChanged) {
      yield _mapFromUsernameChanged(event, state);
    } else if (event is LogInPasswordChanged) {
      yield _mapFromPasswordChanged(event, state);
    } else if (event is LogInSubmitted) {
      yield* _mapFromSubmitted(event, state);
    }
  }

  LogInState _mapFromUsernameChanged(
    LogInUsernameChanged event,
    LogInState state,
  ) {
    final username = LogInUserName.dirty(event.username);

    return state.copyWith(
      username: username,
      status: Formz.validate([state.password, username]),
    );
  }

  LogInState _mapFromPasswordChanged(
      LogInPasswordChanged event, LogInState state) {
    final password = LogInPassword.dirty(event.password);

    return state.copyWith(
      password: password,
      status: Formz.validate([state.username, password]),
    );
  }

  Stream<LogInState> _mapFromSubmitted(
    LogInSubmitted event,
    LogInState state,
  ) async* {
    if (!state.status.isValidated) {
      return;
    }

    yield state.copyWith(status: FormzStatus.submissionInProgress);

    try {
      // final token = await authenticationRepository.authenticate(
      //   login: state.username.value,
      //   password: state.password.value,
      // );
      final token = "";

      yield state.copyWith(status: FormzStatus.submissionSuccess);

      Navigator.pop(event.context);

      authBloc.add(LoggedInEvent(token: token));
      await openSuccessDialog(event.context);
    } on Exception {
      yield state.copyWith(status: FormzStatus.submissionFailure);
      await openFailureDialog(event.context);
    }
  }
}
