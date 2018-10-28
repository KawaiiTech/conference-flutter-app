import 'dart:io';

import 'package:dachfest/data/local_data.dart';
import 'package:dachfest/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Create Schedule and get first talk', () async {
    Schedule schedule = await getSchedule();
    expect(schedule.day1.track1.talks[0].id, "registration");
  });

  test('Get second talk', () async {
    Schedule schedule = await getSchedule();
    expect(schedule.day1.track1.talks[1].id, "opening");
  });

  test('Track 2, slot 0, should be empty', () async {
    Schedule schedule = await getSchedule();
    expect(schedule.day1.track2.talks[0].id, "");
  });

  test('Track 2, slot 6, should be lightning-one', () async {
    Schedule schedule = await getSchedule();
    expect(schedule.day1.track2.talks[6].id, "lightning-one");
  });

  test('Last talk should be closing', () async {
    Schedule schedule = await getSchedule();
    expect(schedule.day2.track1.talks[11].id, "closing");
  });

  test('track 3, slot 5 should be sketchnoting', () async {
    Schedule schedule = await getSchedule();
    expect(schedule.day1.track3.talks[5].id, "sketchnoting");
  });

  test('First talk title should be Registration', () async {
    Schedule schedule = await getSchedule();
    expect(schedule.day1.track1.talks[0].title, "Registration");
  });

  test('First slot info title should be 09:00 10:00', () async {
    Schedule schedule = await getSchedule();
    expect(schedule.day1.slotInfo[0].start, "09:00");
    expect(schedule.day1.slotInfo[0].end, "10:00");
  });

  test('Track names for day 1', () async {
    Schedule schedule = await getSchedule();
    expect(schedule.day1.track1.name, "Track One");
    expect(schedule.day1.track2.name, "Track Two");
    expect(schedule.day1.track3.name, "Workshops");
  });
}

Future<Schedule> getSchedule() async {
  final file = new File('data_repo/dachfest-2018.json');
  final data = decode(await file.readAsString());
  final schedule = parseSchedule(data);
  return schedule;
}
