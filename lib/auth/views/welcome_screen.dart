import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hcb_hackathon/app/app_routes.dart';
import 'package:hcb_hackathon/themes/filled_button.dart';
import 'package:hcb_hackathon/themes/text_constants.dart';
import 'package:hcb_hackathon/themes/theme_constants.dart';
import 'background.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(maxWidth: 375, maxHeight: 812));

    return Background(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kSpacingUnit * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Добро пожаловать\n в EasyWallet',
              style: kHeadingTextStyle.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: kSpacingUnit * 2),
            Text(
              'Мы разработали современное и простое в использовании приложение, которое поможет вам переводить деньги всего за несколько кликов.',
              style: kBodyTextStyle.copyWith(color: kTextLightColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: kSpacingUnit * 2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FilledButton(
                  text: 'Войти',
                  fillColor: kSecondaryColor,
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.logIn);
                  },
                ),
              ],
            ),
            SizedBox(height: kSpacingUnit),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
                textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                side: BorderSide(color: Colors.white, width: 1),
                minimumSize: Size(double.infinity, 42),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
              child: Text('Создать кошелёк'),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.signUp);
              },
            ),
          ],
        ),
      ),
    );
  }
}
