import 'package:dachfest/domain/domain.dart';

final Schedule mockSchedule = Schedule(
    day1: Day(
        track1: Track(
            talks: mockTalks
        ),
        track2: Track(
            talks: mockTalks
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
            talks: mockTalks
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
    title: "Sketchnoting Workshop",
  ),
  Talk(
    title: "Sketchnoting Workshop",
  ),
  Talk(
    title: "Sketchnoting Workshop",
  ),
  Talk(
    title: "Sketchnoting Workshop",
  ),
];
