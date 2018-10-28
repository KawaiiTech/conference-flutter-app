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

Day parseDay(Map<String, dynamic> day1data, Map<String, dynamic> data) {
  final List<dynamic> timeslots = day1data['timeslots'];

  final track1 = <Talk>[];
  final track2 = <Talk>[];
  final track3 = <Talk>[];

  for (final slot in timeslots) {
    final List<dynamic> sessions = slot['sessions'];
    final talk1 = sessions[0]['items'][0];
    track1.add(Talk(title: talk1));
    if (sessions.length > 1) {
      final talk2 = sessions[1]['items'][0];
      track2.add(Talk(title: talk2));
    } else {
      track2.add(Talk(title: ""));
    }
  }

  return Day(
    track1: Track(talks: track1),
    track2: Track(talks: track2),
    track3: Track(talks: track3),
  );
}

List<Talk> parseTalks(Map<String, dynamic> data) {
  final Map<String, dynamic> sessions = data['sessions'];
  final keys = sessions.keys;
  final List<Talk> talks = keys.map((key) {
    return Talk(
      title: sessions[key]['title'],
    );
  }).toList();
  return talks;
}

Future<List<Talk>> getAllTalks(BuildContext context) async {
  return parseTalks(decode(await loadJson(context)));
}
