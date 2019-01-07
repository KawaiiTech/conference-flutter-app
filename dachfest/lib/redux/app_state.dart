import 'package:dachfest/domain/domain.dart';

class AppState {
  Schedule schedule;
  Screen screen;

  AppState({this.schedule, this.screen});

  factory AppState.init() => AppState(schedule: null, screen: Screen.Day1);

  @override
  String toString() {
    return 'AppState{schedule: $schedule, screen: $screen}';
  }
}

enum Screen {
  Day1, Day2, Info
}