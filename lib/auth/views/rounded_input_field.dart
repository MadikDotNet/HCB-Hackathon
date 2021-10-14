import 'package:flutter/material.dart';
import 'package:hj_banking_mobile/auth/views/text_field_container.dart';
import 'package:hj_banking_mobile/themes/theme_constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final String initialValue;
  final ValueChanged<String> onChanged;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
    required this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        initialValue: initialValue,
        style: TextStyle(
          color: Colors.white,
          decorationColor: Colors.white,
        ),
        decoration: InputDecoration(
          icon: Icon(
            icon,
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
