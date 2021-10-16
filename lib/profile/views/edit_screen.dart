import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hcb_hackathon/home/views/custom_app_bar.dart';
import 'package:hcb_hackathon/profile/edit/email/views/email_screen.dart';
import 'package:hcb_hackathon/profile/edit/password/views/password_screen.dart';
import 'package:hcb_hackathon/themes/text_constants.dart';
import 'package:hcb_hackathon/themes/theme_constants.dart';

import 'edit/pin_code/pin_code_edit_screen.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kSpacingUnit * 2),
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: kSpacingUnit * 2),
              padding: EdgeInsets.all(kSpacingUnit * 2),
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
                  Text(
                    'Доступ и безопасность',
                    style: kSubheaderTextStyle,
                  ),
                  SizedBox(height: kSpacingUnit),
                  _securityList(context, Icons.arrow_forward_ios_rounded,
                      'Сменить пароль', PasswordScreen()),
                  _securityList(context, Icons.arrow_forward_ios_rounded,
                      'Сменить E-mail', EmailScreen()),
                  _securityList(context, Icons.arrow_forward_ios_rounded,
                      'Сменить ПИН-код', EditPinCodeScreen()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Push-уведомления", style: kBodyTextStyle),
                      Transform.scale(
                        scale: 0.8,
                        child: CupertinoSwitch(
                          value: _switchValue,
                          onChanged: (value) {
                            setState(() {
                              _switchValue = value;
                            });
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _securityList(BuildContext context, icon, text, route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kSpacingUnit * 1.1),
      child: GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              textAlign: TextAlign.start,
              style: kBodyTextStyle,
            ),
            Icon(
              icon,
              color: Colors.grey[400],
              size: 18,
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
