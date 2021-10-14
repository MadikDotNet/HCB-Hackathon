import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:hj_banking_mobile/auth/sign-up/models/sign_up_email.dart';
import 'package:hj_banking_mobile/auth/sign-up/models/sign_up_page.dart';
import 'package:hj_banking_mobile/auth/sign-up/models/sign_up_password.dart';
import 'package:hj_banking_mobile/auth/sign-up/models/sign_up_phone_number.dart';
import 'package:hj_banking_mobile/auth/sign-up/models/sign_up_user_name.dart';

class SignUpState extends Equatable with FormzMixin {
  const SignUpState({
    this.page = SignUpPage.MainInformation,
    this.userName = const SignUpUserName.pure(),
    this.email = const SignUpEmail.pure(),
    this.phoneNumber = const SignUpPhoneNumber.pure(),
    this.password = const SignUpPassword.pure(),
    this.repeatPassword = "",
  });

  final SignUpPage page;
  final SignUpUserName userName;
  final SignUpEmail email;
  final SignUpPhoneNumber phoneNumber;
  final SignUpPassword password;
  final String repeatPassword;

  SignUpState copyWith({
    SignUpPage? page,
    SignUpUserName? userName,
    SignUpEmail? email,
    SignUpPhoneNumber? phoneNumber,
    SignUpPassword? password,
    String? repeatPassword,
  }) {
    return SignUpState(
      page: page ?? this.page,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      repeatPassword: repeatPassword ?? this.repeatPassword,
    );
  }

  @override
  List<Object?> get props =>
      [page, userName, email, phoneNumber, password, repeatPassword];

  @override
  List<FormzInput> get inputs => [userName, email, phoneNumber, password];

  @override
  FormzStatus get status {
    if (password.value != repeatPassword) {
      return FormzStatus.invalid;
    }
    return super.status;
  }
}
