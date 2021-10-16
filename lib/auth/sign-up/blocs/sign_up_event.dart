import 'package:equatable/equatable.dart';
import 'package:hcb_hackathon/auth/sign-up/models/sign_up_page.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpPageChanged extends SignUpEvent {
  const SignUpPageChanged(this.page);

  final SignUpPage page;

  @override
  List<Object> get props => [page];
}

abstract class SignUpValueChanged extends SignUpEvent {
  const SignUpValueChanged(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}

class SignUpUserNameChanged extends SignUpValueChanged {
  const SignUpUserNameChanged(String value) : super(value);
}

class SignUpEmailChanged extends SignUpValueChanged {
  const SignUpEmailChanged(String value) : super(value);
}

class SignUpPhoneNumberChanged extends SignUpValueChanged {
  const SignUpPhoneNumberChanged(String value) : super(value);
}

class SignUpPasswordChanged extends SignUpValueChanged {
  const SignUpPasswordChanged(String value) : super(value);
}

class SignUpRepeatPasswordChanged extends SignUpValueChanged {
  const SignUpRepeatPasswordChanged(String value) : super(value);
}

class SignUpSubmitted extends SignUpEvent {
  const SignUpSubmitted();
}
