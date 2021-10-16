import 'package:flutter/material.dart';
import 'package:hcb_hackathon/themes/theme_constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: kSpacingUnit),
      padding: EdgeInsets.symmetric(horizontal: kSpacingUnit * 2),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        border: Border.all(color: kTextLightColor, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
