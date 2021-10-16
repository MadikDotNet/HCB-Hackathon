import 'package:flutter/material.dart';
import 'package:hcb_hackathon/profile/views/support_screen.dart';
import 'package:hcb_hackathon/themes/text_constants.dart';
import 'package:hcb_hackathon/themes/theme_constants.dart';
import 'package:hcb_hackathon/transactions/wallet/views/balance.dart';

import 'edit_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kSpacingUnit * 2),
        child: ListView(
          children: [
            Balance(),
            Balance(),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: kSpacingUnit * 2),
              padding: EdgeInsets.symmetric(
                  vertical: kSpacingUnit, horizontal: kSpacingUnit * 2),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: kSpacingUnit,
                    offset: Offset(0, kSpacingUnit / 2),
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(kSpacingUnit),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _listItem(
                      context, 'assets/images/mycards.png', 'Смартфон Apple iPhone 13 \n Pro 128GB Sierra Blue', ''),
                  _listItem(context, 'assets/images/security.png',
                      'Доступ и безопасность', EditScreen()),
                  _listItem(context, 'assets/images/userguide.png',
                      'Служба поддержки', SupportScreen()),
                  _listItem(context, 'assets/images/rules.png',
                      'Правила системы', ''),
                  _listItem(context, 'assets/images/logout.png',
                      'Выйти из кошелька', ''),
                ],
              ),
            ),
          ],
        ),
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
