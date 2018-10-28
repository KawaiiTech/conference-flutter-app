import 'package:dachfest/domain/domain.dart';
import 'package:dachfest/presentation/track_list_view.dart';
import 'package:flutter/material.dart';

class DayScreen extends StatelessWidget {
  final Day day;

  DayScreen(this.day) : assert(day != null);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: TabBar(
          labelColor: Colors.pinkAccent,
          tabs: [
            Text(day.track1.name),
            Text(day.track2.name),
            Text(day.track3.name),
          ],
        ),
        body: TabBarView(
          children: [
            TrackListView(day.track1, day.slotInfo),
            TrackListView(day.track2, day.slotInfo),
            TrackListView(day.track3, day.slotInfo),
          ],
        ),
      ),
    );
  }
}
