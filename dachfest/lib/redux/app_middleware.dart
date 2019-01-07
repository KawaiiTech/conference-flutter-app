
import 'package:dachfest/data/local_data.dart';
import 'package:dachfest/redux/app_state.dart';
import 'package:dachfest/redux/app_actions.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

List<Middleware<AppState>> createStoreMiddleware() {
  return [
    TypedMiddleware<AppState, LoadLocalAction>(_loadLocalAction),
    LoggingMiddleware.printer()
  ];
}

void _loadLocalAction(Store<AppState> store, LoadLocalAction action, NextDispatcher next) {
  getSchedule(action.context).then((schedule) {
    store.dispatch(LoadedAction(schedule: schedule));
  });
}
