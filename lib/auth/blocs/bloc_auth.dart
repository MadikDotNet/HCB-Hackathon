import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcb_hackathon/auth/data/auth_repository.dart';
import 'package:injectable/injectable.dart';

import 'auth_event.dart';
import 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc({
    required this.repository,
  }) : super(const AuthUninitialized());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppStartedEvent) {
      yield* _mapFromAppStarted();
    }

    if (event is LoggedInEvent) {
      yield* _mapFromLoggedIn(event);
    }

    if (event is LoggedOutEvent) {
      yield* _mapFromLoggedOut();
    }
  }

  Stream<AuthState> _mapFromAppStarted() async* {
    yield const AuthLoading();

    if (await repository.init()) {
      yield AuthAuthenticated(token: await repository.getToken());
    } else {
      yield const AuthUnauthenticated();
    }
  }

  Stream<AuthState> _mapFromLoggedIn(LoggedInEvent event) async* {
    yield const AuthLoading();
    await repository.persistToken(event.token);
    yield AuthAuthenticated(token: event.token);
  }

  Stream<AuthState> _mapFromLoggedOut() async* {
    yield const AuthLoading();
    await repository.clearToken();
    yield const AuthUnauthenticated();
  }
}
