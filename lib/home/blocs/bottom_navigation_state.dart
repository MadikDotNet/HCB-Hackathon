import 'package:camera/camera.dart';

abstract class BottomNavigationState {
  const BottomNavigationState();
}

class PageLoadingState extends BottomNavigationState {
  const PageLoadingState();
}

class WalletPageLoadedState extends BottomNavigationState {
  const WalletPageLoadedState();
}

class ServicesPageLoadedState extends BottomNavigationState {
  const ServicesPageLoadedState();
}

class CartPageLoadedState extends BottomNavigationState {
  const CartPageLoadedState();
}

class CameraPageState extends BottomNavigationState {
  CameraPageState({required this.cameraDescription});

  CameraDescription cameraDescription;
}
