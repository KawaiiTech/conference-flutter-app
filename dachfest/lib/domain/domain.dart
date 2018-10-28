class Schedule {
  final Day day1;
  final Day day2;

  Schedule.name(this.day1, this.day2);
}

class Day {
  final Track track1;
  final Track track2;
  final Track track3;

  Day.name(this.track1, this.track2, this.track3);
}

class Track {
  final List<Talk> talks;

  Track.name(this.talks);
}

class Talk {
  final String timeStart; //TODO make as Long
  final String timeEnd;
  final String title;
  final List<Author> authors;

  Talk.name(this.timeStart, this.timeEnd, this.title, this.authors);

  @override
  String toString() {
    return 'Talk: $title';
  }
}

class Author {
  final String name;
  final String picture;

  Author.name(this.name, this.picture);
}
