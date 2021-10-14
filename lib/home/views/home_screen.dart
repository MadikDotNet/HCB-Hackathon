import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hj_banking_mobile/home/blocs/bottom_navigation_bloc.dart';
import 'package:hj_banking_mobile/home/blocs/bottom_navigation_event.dart';
import 'package:hj_banking_mobile/home/blocs/bottom_navigation_state.dart';
import 'package:hj_banking_mobile/home/views/custom_app_bar.dart';
import 'package:hj_banking_mobile/profile/views/profile_screen.dart';
import 'package:hj_banking_mobile/services/views/services_screen.dart';
import 'package:hj_banking_mobile/themes/theme_constants.dart';
import 'package:hj_banking_mobile/transactions/history/views/history_screen.dart';
import 'package:hj_banking_mobile/transactions/wallet/views/wallet_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<BottomNavigationBloc>(context).add(HomePageOpenedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: CustomAppBar(),
      ),
      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          if (state is WalletPageLoadedState) {
            return WalletScreen();
          }

          if (state is ServicesPageLoadedState) {
            return ServicesScreen();
          }

          if (state is HistoryPageLoadedState) {
            return HistoryScreen();
          }

          if (state is ProfilePageLoadedState) {
            return ProfileScreen();
          }

          return CircularProgressIndicator();
        },
      ),
      bottomNavigationBar:
          BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
              builder: (BuildContext context, BottomNavigationState state) {
        return _bottomNavigationBar();
      }),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    final BottomNavigationBloc bloc =
        BlocProvider.of<BottomNavigationBloc>(context);

    return BottomNavigationBar(
      selectedItemColor: kAccentColor,
      unselectedItemColor: Colors.grey[500],
      showUnselectedLabels: true,
      currentIndex: bloc.currentIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/wallet.png'),
            ),
            label: "Кошелек"),
        BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/services.png'),
            ),
            label: "Услуги"),
        BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/history.png'),
            ),
            label: "История"),
        BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/profile.png'),
            ),
            label: "Профиль"),
      ],
      onTap: (index) => BlocProvider.of<BottomNavigationBloc>(context)
          .add(PageTappedEvent(index: index)),
    );
  }
}
