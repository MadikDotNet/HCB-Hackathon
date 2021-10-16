import 'package:flutter/material.dart';
import 'package:hcb_hackathon/themes/theme_constants.dart';

class FilledButton extends StatelessWidget {
  final String text;
  final Color fillColor;
  final Function() onPressed;
  const FilledButton({
    Key? key,
    required this.text,
    required this.fillColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text),
      style: TextButton.styleFrom(
        primary: Colors.white,
        textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        padding: EdgeInsets.symmetric(vertical: kSpacingUnit * 1.5),
        backgroundColor: fillColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
    );
  }
}
