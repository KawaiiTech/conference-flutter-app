import 'dart:io';

import 'package:dachfest/data/local_data.dart';
import 'package:dachfest/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Create Schedule and get first talk', () async {
    Schedule schedule = await getSchedule();
    expect(schedule.day1.track1.talks[0].title, "registration");
  });

  test('Get second talk', () async {
    Schedule schedule = await getSchedule();
    expect(schedule.day1.track1.talks[1].title, "opening");
  });

  test('Track 2, slot 0, should be empty', () async {
    Schedule schedule = await getSchedule();
    expect(schedule.day1.track2.talks[0].title, "");
  });

  test('Track 2, slot 6, should be lightning-one', () async {
    Schedule schedule = await getSchedule();
    expect(schedule.day1.track2.talks[6].title, "lightning-one");
  });

  test('Last talk should be closing', () async {
    Schedule schedule = await getSchedule();
    expect(schedule.day2.track1.talks[11].title, "closing");
  });
}

Future<Schedule> getSchedule() async {
  final file = new File('data_repo/dachfest-2018.json');
  final data = decode(await file.readAsString());
  final schedule = parseSchedule(data);
  return schedule;
}
