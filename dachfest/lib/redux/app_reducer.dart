import 'package:dachfest/redux/app_actions.dart';
import 'package:dachfest/redux/app_state.dart';
import 'package:redux/redux.dart';


final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, LoadLocalAction>(_loadLocalAction),
  TypedReducer<AppState, LoadNetworkAction>(_loadNetworkAction),
  TypedReducer<AppState, LoadedAction>(_loadedAction),
  TypedReducer<AppState, Navigate>(_navigate),
]);

AppState _loadLocalAction(AppState state, LoadLocalAction action) {
  return state;
}

AppState _loadNetworkAction(AppState state, LoadNetworkAction action) {
  return state;
}

AppState _loadedAction(AppState state, LoadedAction action) {
  return AppState(schedule: action.schedule, screen: state.screen);
}

AppState _navigate(AppState state, Navigate action) {
  return AppState(schedule: state.schedule, screen: action.screen);
}
