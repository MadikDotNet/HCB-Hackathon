import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcb_hackathon/home/blocs/bottom_navigation_bloc.dart';
import 'package:hcb_hackathon/home/blocs/bottom_navigation_event.dart';
import 'package:hcb_hackathon/home/blocs/bottom_navigation_state.dart';
import 'package:hcb_hackathon/profile/views/profile_screen.dart';
import 'package:hcb_hackathon/services/views/services_screen.dart';
import 'package:hcb_hackathon/themes/theme_constants.dart';
import 'package:hcb_hackathon/transactions/history/views/history_screen.dart';
import 'package:hcb_hackathon/transactions/qr_code/camera.dart';
import 'package:hcb_hackathon/transactions/wallet/views/wallet_screen.dart';

import 'custom_app_bar.dart';

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

          if (state is QrCodePageState) {
            return getCameraPage();
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
        BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/profile.png'),
            ),
            label: "QR"),
      ],
      onTap: (index) => BlocProvider.of<BottomNavigationBloc>(context)
          .add(PageTappedEvent(index: index)),
    );
  }
}

Widget getCameraPage() {
  var cameras;
  availableCameras().then((value) => cameras = value);
  return CameraApp(cameras);
}
