import 'package:flutter/material.dart';
import 'package:hcb_hackathon/themes/text_constants.dart';
import 'package:hcb_hackathon/themes/theme_constants.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView
        (
        children: [
          SingleChildScrollView(
              child: Image.asset(
                'assets/images/cart-page.png',
              )
          )
        ],
      ),
    );
  }

  Widget _listItem(BuildContext context, icon, text, route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kSpacingUnit),
      child: GestureDetector(
        child: Stack(
          children: [
            Row(
              children: [
                Image.asset(
                  icon,
                  width: 25,
                ),
                SizedBox(width: kSpacingUnit),
                Text(
                  text,
                  style: kBodyTextStyle,
                ),
              ],
            ),
            Positioned(
              child: Icon(
                Icons.keyboard_arrow_right_rounded,
                color: Colors.grey[400],
              ),
              right: 0,
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => route,
            ),
          );
        },
      ),
    );
  }
}
