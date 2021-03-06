import 'package:flutter/material.dart';
import 'package:hcb_hackathon/cards/tied/views/tied.dart';
import 'package:hcb_hackathon/main_page/deposit/views/deposit_screen.dart';
import 'package:hcb_hackathon/themes/theme_constants.dart';


class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kSpacingUnit * 2),
        child: ListView(
          children: [
            Column(
              children: [_topUpWalletButton(context), TiedCards()],
            )
          ],
        ),
      ),
    );
  }

  Widget _topUpWalletButton(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: kSpacingUnit * 2),
      padding: EdgeInsets.all(kSpacingUnit * 3),
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
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_circle_outline,
                  size: 52,
                  color: kPositiveColor,
                ),
                SizedBox(height: kSpacingUnit * 1.5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const DepositScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    '?????????????????? ??????????????',
                    style: TextStyle(
                      color: kPositiveColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
