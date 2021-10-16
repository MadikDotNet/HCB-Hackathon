import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcb_hackathon/config/di.dart';
import 'package:hcb_hackathon/home/blocs/bottom_navigation_bloc.dart';
import 'package:hcb_hackathon/home/blocs/bottom_navigation_event.dart';
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
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              primary: Colors.white,
              onSurface: Colors.red,
            ),
            onPressed: (){
              BlocProvider.of<BottomNavigationBloc>(context).add(PageTappedEvent(index: 3));
              Navigator.pop(context);
            },
            child: Text('Добавить в корзину'),
          )
        ],
      ),
    );
  }
}
