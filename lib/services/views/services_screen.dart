import 'package:flutter/material.dart';
import 'package:hj_banking_mobile/themes/theme_constants.dart';
import 'package:hj_banking_mobile/transactions/wallet/views/balance.dart';
import 'package:hj_banking_mobile/transactions/transfer/views/transfer_screen.dart';
import 'package:hj_banking_mobile/transactions/withdraw/views/withdraw_screen.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kSpacingUnit * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Balance(),
            serviceWidget(
                "transferIcon", "Перевод на кошелёк", TransferScreen()),
            serviceWidget("withdrawIcon", "Вывод средств", WithdrawScreen()),
          ],
        ),
      ),
    );
  }

  Container serviceWidget(String img, String name, route) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: kSpacingUnit),
      padding: EdgeInsets.symmetric(
          vertical: kSpacingUnit * 2.5, horizontal: kSpacingUnit * 1.5),
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => route,
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: kSpacingUnit * 1.5),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/$img.png'),
                        fit: BoxFit.contain),
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
