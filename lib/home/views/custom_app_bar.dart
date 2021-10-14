import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hj_banking_mobile/auth/blocs/auth_bloc.dart';
import 'package:hj_banking_mobile/auth/blocs/auth_event.dart';
import 'package:hj_banking_mobile/themes/theme_constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AppBar(
      centerTitle: true,
      shadowColor: kShadowColor1,
      elevation: 10,
      title: Image(
        image: AssetImage('assets/images/logo.png'),
        width: size.width * 0.4,
      ),
      actions: [
        IconButton(
            onPressed: () =>
                BlocProvider.of<AuthBloc>(context).add(LoggedOutEvent()),
            icon: Icon(Icons.logout))
      ],
    );
  }
}
