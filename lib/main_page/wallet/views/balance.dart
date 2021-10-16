import 'package:flutter/material.dart';
import 'package:hcb_hackathon/themes/theme_constants.dart';

class Balance extends StatelessWidget {
  const Balance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: kSpacingUnit * 2),
          padding: EdgeInsets.all(kSpacingUnit * 1),
          /*decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/balance_bg.png'),
              fit: BoxFit.cover,
            ),
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
          ),*/
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ImageIcon(
                          AssetImage('assets/images/iphone.png'),
                        ),
                        Text(
                          'Смартфон Apple iPhone 13 \nPro 128GB Sierra Blue',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Roboto'
                          ),
                        ),
                        Text(
                          '619 990 ₸ ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: kSpacingUnit),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
