import 'package:flutter/material.dart';
import 'package:hj_banking_mobile/cards/tied/views/list.dart';
import 'package:hj_banking_mobile/cards/tied/views/new/views/add_new_card_screen.dart';
import 'package:hj_banking_mobile/themes/theme_constants.dart';

class TiedCards extends StatelessWidget {
  const TiedCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(kSpacingUnit * 2),
      margin: EdgeInsets.only(bottom: kSpacingUnit * 2),
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
            'Мои карты',
            style: TextStyle(
              color: kTextColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: kSpacingUnit * 2),
          Row(
            children: [
              List(),
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
                  size: 30,
                ),
              ),
              SizedBox(width: kSpacingUnit),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddNewCardScreen(),
                    ),
                  );
                },
                child: Text(
                  'Привязать карту',
                  style: TextStyle(
                      color: kAccentColor, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
