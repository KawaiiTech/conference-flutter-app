import 'package:dachfest/data/mock_data.dart';
import 'package:dachfest/presentation/schedule_screen.dart';
import 'package:dachfest/redux/app_actions.dart';
import 'package:dachfest/redux/app_middleware.dart';
import 'package:dachfest/redux/app_state.dart';
import 'package:dachfest/redux/app_reducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class CFCampApp extends StatelessWidget {
  final store = new Store<AppState>(
    appReducer,
    initialState: AppState.init(),
    middleware: createStoreMiddleware(),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        home: StoreBuilder<AppState>(
          onInit: (store) => store.dispatch(LoadedAction(schedule: mockSchedule)),
          builder: (context, store) {
            return ScheduleScreen();
          },
        ),
        theme: ThemeData(
          primaryColor: Color(0xFF673ab7),
          accentColor: Color(0xFFFFA726),
          primaryColorLight: Color(0x33673ab7),
        ),
      ),
    );
  }
}
