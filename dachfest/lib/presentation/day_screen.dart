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
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          labelPadding: EdgeInsets.all(16.0),
          labelColor: Theme.of(context).primaryColor,
          tabs: [
            Text(day.track1.name, textScaleFactor: 1,),
            Text(day.track2.name, textScaleFactor: 1,),
          ],
        ),
        body: TabBarView(
          children: [
            TrackListView(
              day.track1,
              getOffsetMethod: () => listViewOffset,
              setOffsetMethod: (offset) => this.listViewOffset = offset,
            ),
            TrackListView(
              day.track2,
              getOffsetMethod: () => listViewOffset,
              setOffsetMethod: (offset) => this.listViewOffset = offset,
            ),
          ],
        ),
      ),
    );
  }
}
