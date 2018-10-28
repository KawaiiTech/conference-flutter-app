import 'dart:async' show Future;
import 'dart:convert' as parser;
import 'package:dachfest/data/talk.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadJson() async {
  return await rootBundle.loadString('data_repo/dachfest-2018.json');
}

Map<String, dynamic> decode(String string) {
  return parser.jsonDecode(string);
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
