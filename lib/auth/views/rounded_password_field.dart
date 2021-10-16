import 'package:flutter/material.dart';
import 'package:hcb_hackathon/auth/views/text_field_container.dart';
import 'package:hcb_hackathon/themes/theme_constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final String hintText;
  final String initialValue;
  final ValueChanged<String> onChanged;

  const RoundedPasswordField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        obscureText: true,
        style: TextStyle(
          color: Colors.white,
          decorationColor: Colors.white,
        ),
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: kTextLightColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kTextLightColor,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: kTextLightColor),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
