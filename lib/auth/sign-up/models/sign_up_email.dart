import 'package:formz/formz.dart';

enum SignUpEmailValidationError { empty }

class SignUpEmail extends FormzInput<String, SignUpEmailValidationError> {
  const SignUpEmail.pure() : super.pure('');
  const SignUpEmail.dirty([String value = '']) : super.dirty(value);

  @override
  SignUpEmailValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : SignUpEmailValidationError.empty;
  }
}
