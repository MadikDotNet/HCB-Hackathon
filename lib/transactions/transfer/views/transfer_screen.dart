import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hcb_hackathon/home/views/custom_app_bar.dart';
import 'package:hcb_hackathon/themes/filled_button.dart';
import 'package:hcb_hackathon/themes/filled_input_field.dart';
import 'package:hcb_hackathon/themes/text_constants.dart';
import 'package:hcb_hackathon/themes/theme_constants.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
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
              'Перевод на карту',
              style: kSubheaderTextStyle,
            ),
            SizedBox(height: kSpacingUnit),
            FilledInputField(
              label: 'Телефон получателя:',
              hintText: '+7 XXX XX XX',
              error: 'Обязательное поле',
            ),
            SizedBox(height: kSpacingUnit),
            FilledInputField(
              label: 'Сумма:',
              hintText: '5,000',
              error: 'Обязательное поле',
            ),
            SizedBox(height: kSpacingUnit * 2),
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
            SizedBox(height: kSpacingUnit),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FilledButton(
                  text: 'Пополнить',
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
