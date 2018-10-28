import 'dart:async' show Future;
import 'dart:convert' as parser;
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadJson() async {
  return await rootBundle.loadString('data_repo/dachfest-2018.json');
}

Map<String, dynamic> decode(String string) {
  return parser.jsonDecode(string);
}
