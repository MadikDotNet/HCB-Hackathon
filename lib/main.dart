import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hj_banking_mobile/app/hachathon_app.dart';
import 'package:hj_banking_mobile/auth/blocs/auth_bloc.dart';
import 'package:hj_banking_mobile/config/di.dart';
import 'package:hj_banking_mobile/themes/theme_constants.dart';
import 'home/blocs/bottom_navigation_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = DevelopmentOverrides();
  configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: _configureBlocs(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Auth',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: 'Poppins',
        ),
        home: HJBankingApp(),
      ),
    ),
  );
}

List<BlocProvider> _configureBlocs() {
  return [
    BlocProvider<AuthBloc>.value(
      value: getIt.get<AuthBloc>(),
    ),
    BlocProvider<BottomNavigationBloc>.value(
      value: getIt.get<BottomNavigationBloc>(),
    ),
  ];
}

class DevelopmentOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}
