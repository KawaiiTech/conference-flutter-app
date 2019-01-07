import 'package:dachfest/data/local_data.dart';
import 'package:dachfest/data/network_data.dart';
import 'package:dachfest/domain/domain.dart';
import 'package:dachfest/presentation/day_screen.dart';
import 'package:dachfest/presentation/info_screen.dart';
import 'package:dachfest/redux/app_actions.dart';
import 'package:dachfest/redux/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (context, vm) {
          return _ScheduleScreen(
            schedule: vm.schedule,
            screen: vm.screen,
            onNavigate: vm.onNavigate,
          );
        });
  }
}

class _ViewModel {
  final Schedule schedule;
  final Screen screen;
  final Function onNavigate;

  _ViewModel({
    this.schedule,
    this.screen,
    this.onNavigate,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      schedule: store.state.schedule,
      screen: store.state.screen,
      onNavigate: (screen) {
        store.dispatch(Navigate(screen: screen));
      }
    );
  }
}

class _ScheduleScreen extends StatelessWidget {
  final Schedule schedule;
  final Screen screen;
  final Function(Screen) onNavigate;

  _ScheduleScreen({
    this.schedule,
    this.screen,
    this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    Widget body;

    if (schedule == null) {
      body = Container();
    } else {
      switch (screen) {
        case Screen.Day1:
          body = DayScreen(schedule.day1);
          break;
        case Screen.Day2:
          body = DayScreen(schedule.day2);
          break;
        case Screen.Info:
          body = InfoScreen();
          break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/logo.png',
          ),
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Theme.of(context).primaryColor,
          primaryColor: Theme.of(context).accentColor,
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(
                  color: Colors.white,
                ),
              ),
        ),
        child: BottomNavigationBar(
          currentIndex: _screenIndex(screen), // replace by index
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.today),
              title: Text("November 10"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.today),
              title: Text("November 11"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              title: Text("Info"),
            ),
          ],
          onTap: (index) {
            onNavigate(_indexScreen(index));
          },
        ),
      ),
      body: Container(
        child: body,
      ),
    );
  }

  int _screenIndex(Screen screen) {
    switch (screen) {
      case Screen.Day1:
        return 0;
      case Screen.Day2:
        return 1;
      case Screen.Info:
        return 2;
      default:
        return 0;
    }
  }

  Screen _indexScreen(int index) {
    switch (index) {
      case 0:
        return Screen.Day1;
      case 1:
        return Screen.Day2;
      case 2:
        return Screen.Info;
      default:
        return Screen.Day1;
    }
  }
}

