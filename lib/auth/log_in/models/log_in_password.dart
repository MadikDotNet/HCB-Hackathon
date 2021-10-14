import 'package:formz/formz.dart';

enum LogInPasswordValidationError { empty }

class LogInPassword extends FormzInput<String, LogInPasswordValidationError> {
  const LogInPassword.pure() : super.pure('');
  const LogInPassword.dirty([String value = '']) : super.dirty(value);

  @override
  LogInPasswordValidationError? validator(String? value) {
    return value?.isNotEmpty == true
        ? null
        : LogInPasswordValidationError.empty;
  }
}
