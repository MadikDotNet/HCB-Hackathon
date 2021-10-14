import 'package:formz/formz.dart';

enum SignUpUserNameValidationError { empty }

class SignUpUserName extends FormzInput<String, SignUpUserNameValidationError> {
  const SignUpUserName.pure() : super.pure('');
  const SignUpUserName.dirty([String value = '']) : super.dirty(value);

  @override
  SignUpUserNameValidationError? validator(String? value) {
    return value?.isNotEmpty == true
        ? null
        : SignUpUserNameValidationError.empty;
  }
}
