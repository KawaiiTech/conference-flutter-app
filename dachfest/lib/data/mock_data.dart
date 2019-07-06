import 'package:dachfest/domain/domain.dart';

final Schedule mockSchedule = Schedule(
    day1: Day(
      track1: Track(talks: mockTalks, name: 'Track 1'),
      track2: Track(talks: mockTalks2, name: 'Track 2'),
    ),
    day2: Day(
      track1: Track(talks: mockTalks, name: 'Track 1'),
      track2: Track(talks: mockTalks2, name: 'Track 2'),
    ));

final List<Talk> mockTalks = [
  Talk(
      title: "Registration",
      start: DateTime(2018, 11, 8, 8, 0),
      end: DateTime(2018, 11, 8, 8, 45),
  ),
  Talk(
    title: "Welcome",
    start: DateTime(2018, 11, 8, 8, 45),
    end: DateTime(2018, 11, 8, 9, 0),
  ),
  Talk(
    title: "Adobe ColdFusion 2018",
    start: DateTime(2018, 11, 8, 9, 0),
    end: DateTime(2018, 11, 8, 10, 0),
  ),
  Talk(
    title: "Coffee Break",
    start: DateTime(2018, 11, 8, 10, 0),
    end: DateTime(2018, 11, 8, 10, 20),
  ),
  Talk(
    title: "I do CFML, java, PHP and… human rights!",
    start: DateTime(2018, 11, 8, 10, 20),
    end: DateTime(2018, 11, 8, 11, 10),
  ),
  Talk(
    title: "GDPR: concerns on a WebDev",
    start: DateTime(2018, 11, 8, 11, 20),
    end: DateTime(2018, 11, 8, 12, 10),
  ),
];
final List<Talk> mockTalks2 = [
  Talk(
    start: DateTime(2018, 11, 8, 8, 0),
    end: DateTime(2018, 11, 8, 8, 45),
  ),
  Talk(
    start: DateTime(2018, 11, 8, 8, 45),
    end: DateTime(2018, 11, 8, 9, 0),
  ),
  Talk(
    start: DateTime(2018, 11, 8, 9, 0),
    end: DateTime(2018, 11, 8, 10, 0),
  ),
  Talk(
    start: DateTime(2018, 11, 8, 10, 0),
    end: DateTime(2018, 11, 8, 10, 20),
  ),
  Talk(
    title: "Going live with Commandbox and Docker!",
    start: DateTime(2018, 11, 8, 10, 20),
    end: DateTime(2018, 11, 8, 11, 10),
  ),
  Talk(
    title: "See why FusionReactor is the #1 monitoring solution for CF - then go find out for yourself with a complimentary FR license!",
    start: DateTime(2018, 11, 8, 11, 20),
    end: DateTime(2018, 11, 8, 12, 10),
  ),
];
