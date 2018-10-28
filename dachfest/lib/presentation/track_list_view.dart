import 'package:dachfest/domain/domain.dart';
import 'package:dachfest/presentation/talk_view.dart';
import 'package:flutter/material.dart';

class TrackListView extends StatelessWidget {
  final Track track;
  final List<SlotInfo> slotInfo;

  TrackListView(this.track, this.slotInfo)
      : assert(track != null),
        assert(slotInfo != null);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return getTalkWidget(index);
      },
      itemCount: track.talks.length,
    );
  }

  Widget getTalkWidget(int position) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        TimeView(slotInfo[position]),
        Expanded(child: TalkView(track.talks[position])),
      ],
    );
  }
}

class TimeView extends StatelessWidget {
  final SlotInfo slotInfo;

  TimeView(this.slotInfo);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(slotInfo.start),
            Text(slotInfo.end),
          ],
        ),
      ),
    );
  }
}
