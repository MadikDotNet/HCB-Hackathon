import 'package:flutter/material.dart';
import 'package:hj_banking_mobile/cards/tied/views/list.dart';
import 'package:hj_banking_mobile/home/views/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:hj_banking_mobile/themes/filled_button.dart';
import 'package:hj_banking_mobile/themes/filled_input_field.dart';
import 'package:hj_banking_mobile/themes/text_constants.dart';
import 'package:hj_banking_mobile/themes/theme_constants.dart';

class DepositScreen extends StatelessWidget {
  const DepositScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.all(kSpacingUnit * 2),
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
        child: ListView(
          children: [
            Text(
              'Пополнение кошелька',
              style: kSubheaderTextStyle,
            ),
            SizedBox(height: kSpacingUnit),
            FilledInputField(
              label: 'Сумма:',
              hintText: '5,000',
              error: 'Вы не заполнили поле суммы пополнения',
            ),
            SizedBox(height: kSpacingUnit),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: FilledButton(
                    text: '1,000',
                    fillColor: kSecondaryColor,
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: kSpacingUnit / 2),
                Expanded(
                  child: FilledButton(
                    text: '2,000',
                    fillColor: kSecondaryColor,
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: kSpacingUnit / 2),
                Expanded(
                  child: FilledButton(
                    text: '5,000',
                    fillColor: kSecondaryColor,
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: kSpacingUnit / 2),
                Expanded(
                  child: FilledButton(
                    text: '10,000',
                    fillColor: kSecondaryColor,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SizedBox(height: kSpacingUnit),
            Text(
              'Выберите карту:',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: kSpacingUnit / 5),
            Row(
              children: [
                List(),
              ],
            ),
            SizedBox(height: kSpacingUnit * 1.5),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(width: 1, color: kTextLightColor),
                  ),
                  child: Icon(
                    Icons.add,
                    color: kAccentColor,
                    size: 30,
                  ),
                ),
                SizedBox(width: kSpacingUnit),
                Text(
                  'Другая карта',
                  style: TextStyle(
                      color: kAccentColor, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: kSpacingUnit),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FilledButton(
                  text: 'Продолжить',
                  fillColor: kPrimaryColor,
                  onPressed: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
