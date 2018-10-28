import 'package:dachfest/domain/domain.dart';
import 'package:dachfest/presentation/track_list_view.dart';
import 'package:flutter/material.dart';

class DayScreen extends StatelessWidget {
  final Day day;

  DayScreen(this.day) : assert(day != null);

  @override
  Widget build(BuildContext context) {
    return TrackListView(day.track1);
  }
}
