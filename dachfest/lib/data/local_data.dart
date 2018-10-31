import 'dart:async' show Future;

import 'package:dachfest/data/parser.dart';
import 'package:dachfest/domain/domain.dart';
import 'package:flutter/material.dart';

Future<String> loadJson(BuildContext context) async {
  return await DefaultAssetBundle.of(context)
      .loadString('data_repo/default-firebase-data.json');
}

Future<Schedule> getSchedule(BuildContext context) async {
  return parseSchedule(decode(await loadJson(context)));
}
