import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcb_hackathon/auth/blocs/auth_event.dart';
import 'package:hcb_hackathon/auth/blocs/auth_state.dart';
import 'package:hcb_hackathon/auth/blocs/bloc_auth.dart';
import 'package:hcb_hackathon/auth/views/welcome_screen.dart';
import 'package:hcb_hackathon/home/views/home_screen.dart';
import 'package:hcb_hackathon/themes/theme_constants.dart';

import 'app_routes.dart';

class HCBHackathon extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HCBHackathonState();
  }
}

class _HCBHackathonState extends State<HCBHackathon> {
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
