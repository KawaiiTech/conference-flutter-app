
import 'package:dachfest/data/local_data.dart';
import 'package:dachfest/data/network_data.dart';
import 'package:dachfest/redux/app_state.dart';
import 'package:dachfest/redux/app_actions.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

List<Middleware<AppState>> createStoreMiddleware() {
  return [
    LoggingMiddleware.printer(),
    TypedMiddleware<AppState, LoadLocalAction>(_loadLocalAction),
    TypedMiddleware<AppState, LoadNetworkAction>(_loadNetworkAction),
  ];
}

void _loadLocalAction(Store<AppState> store, LoadLocalAction action, NextDispatcher next) {
  getSchedule(action.context).then((schedule) {
    store.dispatch(LoadedAction(schedule: schedule));
    store.dispatch(LoadNetworkAction());
  });
}

void _loadNetworkAction(Store<AppState> store, LoadNetworkAction action, NextDispatcher next) {
  getNetworkSchedule().then((schedule) {
    store.dispatch(LoadedAction(schedule: schedule));
  });

}
