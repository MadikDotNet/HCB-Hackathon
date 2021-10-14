import 'package:flutter/material.dart';
import 'package:hj_banking_mobile/themes/theme_constants.dart';

class FilledInputField extends StatelessWidget {
  final String label;
  final String hintText;
  final String error;
  const FilledInputField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: kSpacingUnit / 2),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.all(kSpacingUnit),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(kSpacingUnit),
            ),
            errorText: error,
            errorStyle: TextStyle(fontSize: 14),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
      ],
    );
  }
}
