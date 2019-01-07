import 'dart:async';

import 'package:dachfest/domain/domain.dart';
import 'package:dachfest/redux/app_state.dart';
import 'package:flutter/widgets.dart';

class LoadLocalAction {
  BuildContext context;

  LoadLocalAction({this.context});

  @override
  String toString() {
    return 'LoadLocalAction{context: $context}';
  }
}

class LoadNetworkAction {
  LoadNetworkAction();

  @override
  String toString() {
    return 'LoadNetworkAction{}';
  }
}

class LoadedAction {
  Schedule schedule;

  LoadedAction({this.schedule});

  @override
  String toString() {
    return 'LoadedAction{schedule: $schedule}';
  }
}

class Navigate {
  Screen screen;

  Navigate.name(this.screen);

  @override
  String toString() {
    return 'Navigate{screen: $screen}';
  }
}


