import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcb_hackathon/home/blocs/bottom_navigation_bloc.dart';
import 'package:hcb_hackathon/home/blocs/bottom_navigation_event.dart';
import 'package:hcb_hackathon/home/blocs/bottom_navigation_state.dart';
import 'package:hcb_hackathon/main_page/camera/camera_page.dart';
import 'package:hcb_hackathon/main_page/wallet/views/wallet_screen.dart';
import 'package:hcb_hackathon/products/screens/products_screen.dart';
import 'package:hcb_hackathon/profile/views/profile_screen.dart';
import 'package:hcb_hackathon/themes/theme_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<BottomNavigationBloc>(context)
        .add(PageTappedEvent(index: 0));
    BlocProvider.of<BottomNavigationBloc>(context).add(HomePageOpenedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<BottomNavigationBloc, BottomNavigationState>(
        listener: (context, state) => {
          if(state is CameraPageState){
            Future.delayed(const Duration(seconds: 2),(){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  ProductScreen()),
              );
            })
          }
        },
        builder: (context, state) {
          if (state is WalletPageLoadedState) {
            return WalletScreen();
          }

          if (state is CameraPageState) {
            return CameraApp(camera: state.cameraDescription);
          }

          if (state is CartPageLoadedState) {
            return CartScreen();
          }

          if (state is ServicesPageLoadedState) {
            return Center(
              child: CircularProgressIndicator(color: Color(0xFFA10505)),
            );
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
      selectedItemColor: kMainColor,
      unselectedItemColor: Colors.grey[500],
      showUnselectedLabels: true,
      currentIndex: bloc.currentIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/red-home.png'),
            ),
            label: "Главная"),
        BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/red-catalog.png'),
            ),
            label: "Каталог"),
        BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/red-scanner.png'),
            ),
            label: "Смарт камера"),
        BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/red-cart.png'),
            ),
            label: "Корзина"),
      ],
      onTap: (index) => BlocProvider.of<BottomNavigationBloc>(context)
          .add(PageTappedEvent(index: index)),
    );
  }
}
