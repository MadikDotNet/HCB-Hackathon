import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hcb_hackathon/home/views/custom_app_bar.dart';
import 'package:hcb_hackathon/themes/filled_button.dart';
import 'package:hcb_hackathon/themes/filled_input_field.dart';
import 'package:hcb_hackathon/themes/text_constants.dart';
import 'package:hcb_hackathon/themes/theme_constants.dart';

class AddNewCardScreen extends StatelessWidget {
  const AddNewCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.45,
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
              'Привязать новую карту',
              style: kSubheaderTextStyle,
            ),
            SizedBox(height: kSpacingUnit * 2),
            FilledInputField(
              label: 'Номер карты:',
              hintText: '',
              error: '',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: FilledInputField(
                    label: 'Срок действия (мм/гг):',
                    hintText: '06/23',
                    error: '',
                  ),
                ),
                SizedBox(width: kSpacingUnit * 2),
                Expanded(
                  flex: 1,
                  child: FilledInputField(
                    label: 'CVV:',
                    hintText: '',
                    error: '',
                  ),
                )
              ],
            ),
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
