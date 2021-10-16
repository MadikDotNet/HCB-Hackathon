import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'bottom_navigation_event.dart';
import 'bottom_navigation_state.dart';

@injectable
class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(PageLoadingState());

  int currentIndex = 0;

  @override
  Stream<BottomNavigationState> mapEventToState(
      BottomNavigationEvent event) async* {
    if (event is HomePageOpenedEvent) {
      this.add(PageTappedEvent(index: this.currentIndex));
    }

    if (event is PageTappedEvent) {
      this.currentIndex = event.index;

      yield PageLoadingState();

      if (this.currentIndex == 0) {
        yield WalletPageLoadedState();
      }

      if (currentIndex == 1) {
        yield ServicesPageLoadedState();
      }

      if (currentIndex == 2) {
        yield HistoryPageLoadedState();
      }

      if (currentIndex == 3) {
        yield ProfilePageLoadedState();
      }

      if (currentIndex == 4) {
        yield QrCodePageState();
      }
    }
  }
}