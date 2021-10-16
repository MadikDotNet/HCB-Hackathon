import 'package:flutter/material.dart';
import 'package:hcb_hackathon/home/views/custom_app_bar.dart';
import 'package:hcb_hackathon/themes/filled_button.dart';
import 'package:hcb_hackathon/themes/filled_input_field.dart';
import 'package:hcb_hackathon/themes/text_constants.dart';
import 'package:hcb_hackathon/themes/theme_constants.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(),
      ),
      body: Padding(
        padding: EdgeInsets.all(kSpacingUnit * 2),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              vertical: kSpacingUnit * 2, horizontal: kSpacingUnit * 2),
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
            children: [
              Text(
                'Сменить E-mail',
                style: kSubheaderTextStyle,
                textAlign: TextAlign.center,
              ),
              FilledInputField(
                  label: '', hintText: 'Введите новый email', error: ''),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FilledButton(
                    text: 'Сменить',
                    fillColor: kPositiveColor,
                    onPressed: () {},
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}