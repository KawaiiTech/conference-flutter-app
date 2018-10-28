import 'package:dachfest/domain/domain.dart';

final Schedule mockSchedule = Schedule(
    day1: Day(
        track1: Track(
            talks: mockTalks
        ),
        track2: Track(
            talks: mockTalks2
        ),
        track3: Track(
            talks: mockTalks
        )
    ),
    day2: Day(
        track1: Track(
            talks: mockTalks
        ),
        track2: Track(
            talks: mockTalks2
        ),
        track3: Track(
            talks: mockTalks
        )
    )
);

final List<Talk> mockTalks = [
  Talk(
    title: "Sketchnoting Workshop",
  ),
  Talk(
    title: "keynote",
  ),
  Talk(
    title: "coffe break",
  ),
  Talk(
    title: "more",
  ),
  Talk(
    title: "party",
  ),
];
final List<Talk> mockTalks2 = [
  Talk(
    title: "Sketchnoting Workshop2",
  ),
  Talk(
    title: "keynote2",
  ),
  Talk(
    title: "coffe break2",
  ),
  Talk(
    title: "more2",
  ),
  Talk(
    title: "party2",
  ),
];
