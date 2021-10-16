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

class ProfilePageLoadedState extends BottomNavigationState {
  const ProfilePageLoadedState();
}

class QrCodePageState extends BottomNavigationState {
  QrCodePageState({required this.cameraDescription});

  CameraDescription cameraDescription;
}
