import 'dart:math';

class Schedule {
  final Day day1;
  final Day day2;

  Schedule({this.day1, this.day2});
}

//class SlotInfo {
//  final String start;
//  final String end;
//
//  SlotInfo({this.start, this.end});
//}

class Day {
  final Track track1;
  final Track track2;

  Day({this.track1, this.track2});

}

class Track {
  final List<Talk> talks;
  final String name;

  Track({this.talks, this.name});
}

final emptyTalk = Talk(
  id: "",
  title: "",
  speakers: [],
);

class Talk {
  final String id;
  final String title;
  final String description;
  final List<Speaker> speakers;
  final DateTime start;
  final DateTime end;

  Talk({this.id, this.title, this.description, this.speakers, this.start, this.end});

  /// A 50 minute session will have 100 pixels height
  double get height {
    return max(3 *
        (_minutesOf(end.millisecondsSinceEpoch) -
            _minutesOf(start.millisecondsSinceEpoch)), 60.0);
  }

  double _minutesOf(int millisecondsSinceEpoch) {
    return millisecondsSinceEpoch / (1000 * 60);
  }
}

class Speaker {
  final id;
  final String name;
  final String picture;

  Speaker({this.id, this.name, this.picture,});
}
