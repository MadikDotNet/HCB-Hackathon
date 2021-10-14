import 'package:formz/formz.dart';

enum SignUpPasswordValidationError { empty }

class SignUpPassword extends FormzInput<String, SignUpPasswordValidationError> {
  const SignUpPassword.pure() : super.pure('');
  const SignUpPassword.dirty([String value = '']) : super.dirty(value);

  @override
  SignUpPasswordValidationError? validator(String? value) {
    return value?.isNotEmpty == true
        ? null
        : SignUpPasswordValidationError.empty;
  }
}
