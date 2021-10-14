import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:hj_banking_mobile/auth/sign-up/blocs/sign_up_bloc.dart';
import 'package:hj_banking_mobile/auth/sign-up/blocs/sign_up_event.dart';
import 'package:hj_banking_mobile/auth/sign-up/blocs/sign_up_state.dart';
import 'package:hj_banking_mobile/auth/sign-up/models/sign_up_page.dart';
import 'package:hj_banking_mobile/auth/views/background.dart';
import 'package:hj_banking_mobile/auth/views/rounded_input_field.dart';
import 'package:hj_banking_mobile/themes/text_constants.dart';
import 'package:hj_banking_mobile/themes/theme_constants.dart';

class SignUpSreen extends StatelessWidget {
  const SignUpSreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.symmetric(horizontal: kSpacingUnit * 2),
          child: BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
              if (state.page == SignUpPage.MainInformation) {
                return _firstPage();
              }
              return _secondPage();
            },
          ),
        ),
      ),
    );
  }

  Widget _firstPage() {
    return Form(
      child: ListView(
        children: [
          Text(
            'Создать кошелёк',
            style: kHeadingTextStyle.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: kSpacingUnit),
        ],
      ),
    );
  }

  Widget _secondPage() {
    return Container();
  }

  Widget _usernameField(BuildContext context, SignUpState state) {
    return RoundedInputField(
      hintText: 'Имя пользователя',
      initialValue: state.userName.value,
      onChanged: (value) => BlocProvider.of<SignUpBloc>(context)
          .add(SignUpUserNameChanged(value)),
    );
  }

  Widget _invalidFieldMessage(FormzInput value,
      {String message = "Обязательное поле"}) {
    return value.invalid
        ? Text(
            message,
            style: TextStyle(
              color: Colors.red,
            ),
          )
        : SizedBox(
            height: kSpacingUnit,
          );
  }
}
