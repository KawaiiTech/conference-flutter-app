class Schedule {
  final Day day1;
  final Day day2;

  Schedule({this.day1, this.day2});
}

class Day {
  final Track track1;
  final Track track2;
  final Track track3;

  Day({this.track1, this.track2, this.track3});
}

class Track {
  final List<Talk> talks;

  Track({this.talks});
}

final emptyTalk = Talk(
  id: "",
  title: "",
  authors: [],
);

class Talk {
  final String id;
  final String title;
  final List<Author> authors;

  Talk({this.id, this.title, this.authors});

  @override
  String toString() {
    return 'Talk: $title';
  }
}

class Author {
  final String name;
  final String picture;

  Author({this.name, this.picture});
}
