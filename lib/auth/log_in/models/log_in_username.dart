import 'package:formz/formz.dart';

enum LogInUserNameValidationError { empty }

class LogInUserName extends FormzInput<String, LogInUserNameValidationError> {
  const LogInUserName.pure() : super.pure('');
  const LogInUserName.dirty([String value = '']) : super.dirty(value);

  @override
  LogInUserNameValidationError? validator(String? value) {
    return value?.isNotEmpty == true
        ? null
        : LogInUserNameValidationError.empty;
  }
}
