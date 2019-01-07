import 'package:dachfest/data/local_data.dart';
import 'package:dachfest/data/network_data.dart';
import 'package:dachfest/domain/domain.dart';
import 'package:dachfest/presentation/day_screen.dart';
import 'package:dachfest/presentation/info_screen.dart';
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
          );
        });
  }
}

class _ViewModel {
  Schedule schedule;

  _ViewModel({this.schedule});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      schedule: store.state.schedule,
    );
  }
}

class _ScheduleScreen extends StatelessWidget {
  Schedule schedule;

  _ScheduleScreen({this.schedule});

  @override
  Widget build(BuildContext context) {

    Widget body;

    if (schedule == null) {
      body = Container();
    } else {
      body = DayScreen(schedule.day1);
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
          canvasColor: Theme
              .of(context)
              .primaryColor,
          primaryColor: Theme
              .of(context)
              .accentColor,
          textTheme: Theme
              .of(context)
              .textTheme
              .copyWith(
            caption: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: 0, // replace by index
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
//            setState(() {
//              _currentIndex = index;
//              switch (index) {
//                case 0:
//                  _currentScreen = DayScreen(_schedule.day1);
//                  break;
//                case 1:
//                  _currentScreen = DayScreen(_schedule.day2);
//                  break;
//                case 2:
//                  _currentScreen = InfoScreen();
//                  break;
//              }
//            });
          },
        ),
      ),
      body: Container(
        child: body,
      ),
    );
  }
}
