import 'package:flutter/material.dart';
import 'package:hcb_hackathon/home/views/custom_app_bar.dart';
import 'package:hcb_hackathon/themes/text_constants.dart';
import 'package:hcb_hackathon/themes/theme_constants.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

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
                    'Служба поддержки',
                    style: kSubheaderTextStyle,
                  ),
                  SizedBox(height: kSpacingUnit),
                  _numberList(context, '+7 771 11 10 10'),
                  _numberList(context, '+7 771 11 10 10'),
                  _numberList(context, '+7 771 11 10 10'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _numberList(BuildContext context, text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kSpacingUnit),
      child: GestureDetector(
        child: Row(
          children: [
            Icon(
              Icons.call,
              color: kPositiveColor,
              size: 25,
            ),
            SizedBox(width: kSpacingUnit),
            Text(
              text,
              style: kBodyTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
