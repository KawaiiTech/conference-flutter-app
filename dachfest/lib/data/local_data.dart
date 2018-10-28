import 'dart:async' show Future;
import 'dart:convert' as parser;

import 'package:dachfest/domain/domain.dart';
import 'package:flutter/material.dart';

Future<String> loadJson(BuildContext context) async {
  return await DefaultAssetBundle.of(context)
      .loadString('data_repo/dachfest-2018.json');
}

Map<String, dynamic> decode(String string) {
  return parser.jsonDecode(string);
}

Schedule parseSchedule(Map<String, dynamic> data) {
  final scheduleData = data['schedule'];
  final day1Data = scheduleData['2018-11-10'];
  final day2Data = scheduleData['2018-11-11'];
  final day1 = parseDay(day1Data, data);
  final day2 = parseDay(day2Data, data);
  return Schedule(
    day1: day1,
    day2: day2,
  );
}

Day parseDay(Map<String, dynamic> daydata, Map<String, dynamic> data) {
  final List<dynamic> timeslots = daydata['timeslots'];

  final track1 = <Talk>[];
  final track2 = <Talk>[];
  final track3 = <Talk>[];
  final slotInfo = <SlotInfo>[];

  for (final slot in timeslots) {
    final List<dynamic> sessions = slot['sessions'];
    final talk1 = sessions[0]['items'][0];
    track1.add(parseTalk(talk1, data));
    if (sessions.length > 1) {
      final talk = sessions[1]['items'][0];
      track2.add(parseTalk(talk, data));
    } else {
      track2.add(emptyTalk);
    }
    if (sessions.length > 2) {
      final talk = sessions[2]['items'][0];
      final extend = sessions[2]['extend'];
      track3.add(parseTalk(talk, data, extend));
    } else {
      track3.add(emptyTalk);
    }
    slotInfo.add(SlotInfo(
      start: slot['startTime'],
      end: slot['endTime'],
    ));
  }

  return Day(
    slotInfo: slotInfo,
    track1: Track(talks: track1, name: daydata['tracks'][0]['title']),
    track2: Track(talks: track2, name: daydata['tracks'][1]['title']),
    track3: Track(talks: track3, name: daydata['tracks'][2]['title']),
  );
}

Talk parseTalk(id, Map<String, dynamic> data, [int extend = 1]) {
  final talk = data['sessions'][id];

  return Talk(
    id: id,
    title: talk['title'],
    extend: extend,
  );
}

Future<Schedule> getSchedule(BuildContext context) async {
  return parseSchedule(decode(await loadJson(context)));
}
