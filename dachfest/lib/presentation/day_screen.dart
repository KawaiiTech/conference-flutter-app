import 'package:dachfest/domain/domain.dart';
import 'package:dachfest/presentation/track_list_view.dart';
import 'package:flutter/material.dart';

class DayScreen extends StatelessWidget {
  final Day day;

  double listViewOffset = 0.0;

  DayScreen(this.day) : assert(day != null);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: TabBar(
          labelPadding: EdgeInsets.all(16.0),
          labelColor: Theme.of(context).primaryColor,
          tabs: [
            Text(day.track1.name),
            Text(day.track2.name),
            Text(day.track3.name),
          ],
        ),
        body: TabBarView(
          children: [
            TrackListView(
              day.track1,
              day.slotInfo,
              getOffsetMethod: () => listViewOffset,
              setOffsetMethod: (offset) => this.listViewOffset = offset,
            ),
            TrackListView(
              day.track2,
              day.slotInfo,
              getOffsetMethod: () => listViewOffset,
              setOffsetMethod: (offset) => this.listViewOffset = offset,
            ),
            TrackListView(
              day.track3,
              day.slotInfo,
              getOffsetMethod: () => listViewOffset,
              setOffsetMethod: (offset) => this.listViewOffset = offset,
            ),
          ],
        ),
      ),
    );
  }
}
