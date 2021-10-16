import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:hcb_hackathon/auth/log_in/blocs/log_in_bloc.dart';
import 'package:hcb_hackathon/auth/log_in/blocs/log_in_event.dart';
import 'package:hcb_hackathon/auth/log_in/blocs/log_in_state.dart';
import 'package:hcb_hackathon/auth/views/background.dart';
import 'package:hcb_hackathon/auth/views/rounded_input_field.dart';
import 'package:hcb_hackathon/auth/views/rounded_password_field.dart';
import 'package:hcb_hackathon/themes/filled_button.dart';
import 'package:hcb_hackathon/themes/text_constants.dart';
import 'package:hcb_hackathon/themes/theme_constants.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocBuilder<LogInBloc, LogInState>(
        builder: (context, state) {
          return Background(
            child: Container(
              height: size.height * 0.5,
              padding: EdgeInsets.symmetric(horizontal: kSpacingUnit * 2),
              child: Form(
                child: ListView(
                  children: [
                    Text(
                      'Войти в кошелёк',
                      style: kHeadingTextStyle.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: kSpacingUnit),
                    _usernameField(context, state),
                    _invalidFieldMessage(state.username),
                    _passwordField(context, state),
                    _invalidFieldMessage(state.password),
                    _loginButton(context, state),
                    _showSignUpButton(state),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _usernameField(BuildContext context, LogInState state) {
    final _state = state;

    return RoundedInputField(
      hintText: 'Имя пользователя',
      initialValue: _state.username.value,
      onChanged: (value) => BlocProvider.of<LogInBloc>(context)
          .add(LogInUsernameChanged(username: value)),
    );
  }

  Widget _passwordField(BuildContext context, LogInState state) {
    final _state = state;

    return RoundedPasswordField(
      hintText: 'Пароль',
      initialValue: _state.password.value,
      onChanged: (value) => BlocProvider.of<LogInBloc>(context)
          .add(LogInPasswordChanged(password: value)),
    );
  }

  Widget _loginButton(BuildContext context, LogInState state) {
    final _state = state;

    return _state.status.isSubmissionInProgress
        ? Center(
            child: CircularProgressIndicator(),
          )
        : FilledButton(
            text: 'Войти',
            fillColor: kSecondaryColor,
            onPressed: () {
              if (_state.status == FormzStatus.valid) {
                BlocProvider.of<LogInBloc>(context)
                    .add(LogInSubmitted(context: context));
              }
            },
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

  Widget _showSignUpButton(LogInState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'У вас нет кошелька?',
          style: kBodyTextStyle.copyWith(color: kTextLightColor),
        ),
        TextButton(
          child: Text(
            'Создать кошелёк',
            style: kBodyTextStyle.copyWith(
                fontWeight: FontWeight.w600, color: kTextLightColor),
          ),
          onPressed: () {
            //do something
          },
        )
      ],
    );
  }
}
