import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hj_banking_mobile/app/app_routes.dart';
import 'package:hj_banking_mobile/auth/blocs/auth_bloc.dart';
import 'package:hj_banking_mobile/auth/blocs/auth_event.dart';
import 'package:hj_banking_mobile/auth/blocs/auth_state.dart';
import 'package:hj_banking_mobile/auth/views/welcome_screen.dart';
import 'package:hj_banking_mobile/home/views/home_screen.dart';
import 'package:hj_banking_mobile/themes/theme_constants.dart';

class HJBankingApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HJBankingAppState();
  }
}

class _HJBankingAppState extends State<HJBankingApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(const AppStartedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: 'Poppins'),
      routes: kRouteWidgets,
      home: Scaffold(
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthAuthenticated) {
              return HomeScreen();
            }

            if (state is AuthUnauthenticated) {
              return WelcomeScreen();
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
