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
          padding: EdgeInsets.all(kSpacingUnit * 1.5),
          decoration: BoxDecoration(
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
          ),
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
                        Text(
                          '+7 701 155 34 15',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Username',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: kSpacingUnit),
                    Text(
                      'Баланс кошелька',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      '5,000 тг',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
