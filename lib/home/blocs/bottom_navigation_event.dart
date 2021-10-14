abstract class BottomNavigationEvent {
  const BottomNavigationEvent();
}

class HomePageOpenedEvent extends BottomNavigationEvent{
  const HomePageOpenedEvent();
}

class PageTappedEvent extends BottomNavigationEvent{
  final int index;

  PageTappedEvent({required this.index});
}
