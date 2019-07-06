import 'package:dachfest/domain/domain.dart';
import 'package:dachfest/presentation/talk_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

typedef double GetOffsetMethod();
typedef void SetOffsetMethod(double offset);

class TrackListView extends StatelessWidget {
  final Track track;

  final GetOffsetMethod getOffsetMethod;
  final SetOffsetMethod setOffsetMethod;
  ScrollController scrollController;

  TrackListView(
    this.track, {
    this.getOffsetMethod,
    this.setOffsetMethod,
  })  : assert(track != null);

  @override
  Widget build(BuildContext context) {
    scrollController = ScrollController(initialScrollOffset: getOffsetMethod());
    var rows = <Widget>[];


    for (var talk in track.talks) {
      rows.add(getTalkWidget(talk));
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

  Widget getTalkWidget(Talk talk) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        TimeView(talk),
        Expanded(child: TalkView(talk)),
      ],
    );
  }
}

class TimeView extends StatelessWidget {
  final Talk talk;

  TimeView(this.talk);

  @override
  Widget build(BuildContext context) {

    if (talk.title == null) {
      return Column();
    }

    return Container(
      height: talk.height,
      width: 60.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(DateFormat.Hm().format(talk.start), textScaleFactor: 1,),
//            Text(DateFormat.Hm().format(talk.end), textScaleFactor: 1,),
          ],
        ),
      ),
    );
  }
}
