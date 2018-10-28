import 'package:dachfest/domain/domain.dart';
import 'package:flutter/material.dart';

class DayGrid extends StatelessWidget {
  final Day day;

  DayGrid(this.day) : assert(day != null);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: day.track1.talks.length * 3,
      itemBuilder: (BuildContext context, int position) {
        switch (position % 3) {
          case 0:
            return getTalkWidget(day.track1, position ~/ 3);
          case 1:
            return getTalkWidget(day.track2, position ~/ 3);
          case 2:
            return getTalkWidget(day.track3, position ~/ 3);
        }

//        switch (position) {
//          case 0:
//            return getTalkListWidget(day.track1);
//          case 1:
//            return getTalkListWidget(day.track2);
//          case 2:
//            return getTalkListWidget(day.track3);
//        }
      },
    );
  }

  Widget getTalkWidget(Track track, int position) {
    return Text(track.talks[position].title);
  }
}
