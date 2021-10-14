import 'package:formz/formz.dart';

enum SignUpPhoneNumberValidationError { empty }

class SignUpPhoneNumber
    extends FormzInput<String, SignUpPhoneNumberValidationError> {
  const SignUpPhoneNumber.pure() : super.pure('');
  const SignUpPhoneNumber.dirty([String value = '']) : super.dirty(value);

  @override
  SignUpPhoneNumberValidationError? validator(String? value) {
    return value?.isNotEmpty == true
        ? null
        : SignUpPhoneNumberValidationError.empty;
  }
}
