import 'package:flutter/material.dart';
import 'package:hj_banking_mobile/themes/theme_constants.dart';

class List extends StatelessWidget {
  const List({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: kSpacingUnit, horizontal: kSpacingUnit * 1.5),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(
            Radius.circular(kSpacingUnit),
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.credit_card_rounded,
              color: kAccentColor,
            ),
            SizedBox(width: kSpacingUnit),
            Text(
              '************1234',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
