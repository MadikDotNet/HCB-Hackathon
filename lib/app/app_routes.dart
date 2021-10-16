import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcb_hackathon/auth/blocs/bloc_auth.dart';
import 'package:hcb_hackathon/auth/data/auth_repository.dart';
import 'package:hcb_hackathon/auth/log_in/blocs/log_in_bloc.dart';
import 'package:hcb_hackathon/auth/log_in/views/log_in_screen.dart';
import 'package:hcb_hackathon/auth/sign-up/blocs/sign_up_bloc.dart';
import 'package:hcb_hackathon/auth/sign-up/views/sign_up_screen.dart';
import 'package:hcb_hackathon/config/di.dart';

abstract class AppRoutes {
  static final logIn = "/login";
  static final signUp = "/sign-up";
}

final kRouteWidgets = <String, Widget Function(BuildContext)>{
  AppRoutes.logIn: (context) {
    return BlocProvider(
      create: (BuildContext context) => LogInBloc(
        authBloc: BlocProvider.of<AuthBloc>(context),
        authenticationRepository: getIt.get<AuthRepository>(),
      ),
      child: LogInScreen(),
    );
  },
  AppRoutes.signUp: (context) {
    return BlocProvider(
      create: (BuildContext context) => SignUpBloc(),
      child: SignUpSreen(),
    );
  },
};
