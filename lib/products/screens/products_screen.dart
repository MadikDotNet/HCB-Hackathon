import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hcb_hackathon/home/views/custom_app_bar.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: CustomAppBar(),
      ),
      body: ListView
        (
        children: [
          Image.asset(
            'assets/images/product.png',
            alignment: Alignment.center,
          )
        ],
      ),
    );
  }
}
