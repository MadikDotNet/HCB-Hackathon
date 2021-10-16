import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:hcb_hackathon/home/views/custom_app_bar.dart';
import 'package:hcb_hackathon/themes/filled_button.dart';
import 'package:hcb_hackathon/themes/filled_input_field.dart';
import 'package:hcb_hackathon/themes/text_constants.dart';
import 'package:hcb_hackathon/themes/theme_constants.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({Key? key}) : super(key: key);

  @override
  _WithdrawScreenState createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(maxWidth: 375, maxHeight: 812));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.7,
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
              'Вывод средств',
              style: kSubheaderTextStyle,
            ),
            SizedBox(height: kSpacingUnit),
            FilledInputField(
              label: 'Сумма:',
              hintText: '5,000',
              error: '',
            ),
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
                    text: '1,000',
                    fillColor: kSecondaryColor,
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: kSpacingUnit / 2),
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
                    text: '1,000',
                    fillColor: kSecondaryColor,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SizedBox(height: kSpacingUnit * 2.5),
            Text(
              "Выберите карту:",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: kSpacingUnit),
            Row(
              children: [

              ],
            ),
            SizedBox(height: kSpacingUnit * 2),
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
                    size: 35,
                  ),
                ),
                SizedBox(width: kSpacingUnit),
                Text(
                  'Другая карта',
                  style: TextStyle(
                      color: kAccentColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: kSpacingUnit * 2),
            const Divider(
              height: 10,
              thickness: 0.5,
              color: Colors.grey,
            ),
            SizedBox(height: kSpacingUnit),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Комиссия:",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey),
                ),
                Text(
                  "0 тг",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey),
                )
              ],
            ),
            SizedBox(height: kSpacingUnit),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Итого:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                Text(
                  "0 тг",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                )
              ],
            ),
            SizedBox(height: kSpacingUnit * 2),
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
