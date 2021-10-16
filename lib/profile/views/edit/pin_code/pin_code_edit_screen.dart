import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hcb_hackathon/home/views/custom_app_bar.dart';
import 'package:hcb_hackathon/themes/text_constants.dart';
import 'package:hcb_hackathon/themes/theme_constants.dart';

class EditPinCodeScreen extends StatefulWidget {
  const EditPinCodeScreen({Key? key}) : super(key: key);

  @override
  _EditPinCodeScreenState createState() => _EditPinCodeScreenState();
}

class _EditPinCodeScreenState extends State<EditPinCodeScreen> {
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Сменить ПИН-код", style: kSubheaderTextStyle),
                  Text(
                    "Придумайте ПИН-код для быстрого входа",
                    style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
