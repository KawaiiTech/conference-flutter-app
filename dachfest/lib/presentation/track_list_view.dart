import 'package:dachfest/domain/domain.dart';
import 'package:dachfest/presentation/talk_view.dart';
import 'package:flutter/material.dart';

typedef double GetOffsetMethod();
typedef void SetOffsetMethod(double offset);

class TrackListView extends StatelessWidget {
  final Track track;
  final List<SlotInfo> slotInfo;

  final GetOffsetMethod getOffsetMethod;
  final SetOffsetMethod setOffsetMethod;
  ScrollController scrollController;

  TrackListView(
    this.track,
    this.slotInfo, {
    this.getOffsetMethod,
    this.setOffsetMethod,
  })  : assert(track != null),
        assert(slotInfo != null);

  @override
  Widget build(BuildContext context) {
    scrollController = ScrollController(initialScrollOffset: getOffsetMethod());
    var rows = <Widget>[];

    for (var i = 0; i < track.talks.length;) {
      rows.add(getTalkWidget(i));
      i += track.talks[i].extend;
    }

    return NotificationListener(
      child: ListView(
        controller: scrollController,
        children: rows,
      ),
      onNotification: (notification) {
        if (notification is ScrollNotification) {
          setOffsetMethod(notification.metrics.pixels);
        }
      },
    );
  }

  Widget getTalkWidget(int position) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        TimeView(slotInfo, position, track.talks[position].extend),
        Expanded(child: TalkView(track.talks[position])),
      ],
    );
  }
}

class TimeView extends StatelessWidget {
  final List<SlotInfo> slotInfo;
  final int position;
  final int extend;

  TimeView(this.slotInfo, this.position, this.extend);

  @override
  Widget build(BuildContext context) {
    var rows = <Widget>[];
    for (var i = 0; i < extend; i++) {
      rows.add(buildContainer(i));
    }
    return Column(children: rows);
  }

  Container buildContainer(int index) {
    return Container(
      height: 100.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(slotInfo[position + index].start),
// TODO: Decide if we want to display the end time or not for each slot
//            Text(slotInfo[position + index].end),
          ],
        ),
      ),
    );
  }
}
