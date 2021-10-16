import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcb_hackathon/auth/sign-up/blocs/sign_up_event.dart';
import 'package:hcb_hackathon/auth/sign-up/blocs/sign_up_state.dart';
import 'package:hcb_hackathon/auth/sign-up/models/sign_up_email.dart';
import 'package:hcb_hackathon/auth/sign-up/models/sign_up_password.dart';
import 'package:hcb_hackathon/auth/sign-up/models/sign_up_phone_number.dart';
import 'package:hcb_hackathon/auth/sign-up/models/sign_up_user_name.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpPageChanged) {
      yield state.copyWith(page: event.page);
    } else if (event is SignUpUserNameChanged) {
      yield state.copyWith(userName: SignUpUserName.dirty(event.value));
    } else if (event is SignUpEmailChanged) {
      yield state.copyWith(email: SignUpEmail.dirty(event.value));
    } else if (event is SignUpPhoneNumberChanged) {
      yield state.copyWith(phoneNumber: SignUpPhoneNumber.dirty(event.value));
    } else if (event is SignUpPasswordChanged) {
      yield state.copyWith(password: SignUpPassword.dirty(event.value));
    } else if (event is SignUpRepeatPasswordChanged) {
      yield state.copyWith(repeatPassword: event.value);
    } else if (event is SignUpSubmitted) {
      //TODO
    }
  }
}
