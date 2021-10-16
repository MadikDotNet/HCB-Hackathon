import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcb_hackathon/auth/blocs/auth_event.dart';
import 'package:hcb_hackathon/auth/blocs/bloc_auth.dart';
import 'package:hcb_hackathon/themes/theme_constants.dart';

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
      backgroundColor: Color(0xFFA10505),
      title: Image(
        image: AssetImage('assets/images/logo.png'),
        width: size.width * 0.1,
        color: Colors.white,
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
