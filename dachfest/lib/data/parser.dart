import 'package:dachfest/domain/domain.dart';
import 'dart:convert' as parser;

// TODO: This is broken
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
      final extend = sessions[2]['extend'] ?? 1;
      track3.add(parseTalk(talk, data, extend));
    } else {
      track3.add(emptyTalk);
    }
  }

  return Day(
    track1: Track(talks: track1, name: daydata['tracks'][0]['title']),
    track2: Track(talks: track2, name: daydata['tracks'][1]['title']),
  );
}

Talk parseTalk(id, Map<String, dynamic> data, [int extend = 1]) {
  final talk = data['sessions'][id];

  return Talk(
    id: id,
    title: talk['title'],
    description: talk['description'],
    speakers: parseSpeakers(talk['speakers'], data),
  );
}

List<Speaker> parseSpeakers(List<dynamic> speakerIds, data) {
  final speakersData = data['speakers'];
  final List<Speaker> speakers = <Speaker>[];
  if (speakerIds == null) {
    return <Speaker>[];
  }
  for (String speakerId in speakerIds) {
    final speakerData = speakersData[speakerId];
    Speaker speaker = Speaker(
      id: speakerId,
      name: speakerData['name'],
      picture: speakerData['photoUrl'],
    );
    speakers.add(speaker);
  }
  return speakers;
}

