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
            Text("Track 1"),
            Text("Track 2"),
            Text("Workshops"),
          ],
        ),
        body: TabBarView(
          children: [
            TrackListView(day.track1),
            TrackListView(day.track2),
            TrackListView(day.track3),
          ],
        ),
      ),
    );
  }
}
