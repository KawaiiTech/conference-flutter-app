import 'package:dachfest/data/parser.dart';
import 'package:dachfest/domain/domain.dart';
import 'package:http/http.dart' as http;

const URL =
    'https://raw.githubusercontent.com/DACHFest/dachfest.com/master/docs/default-firebase-data.json';

Future<String> fetchData() async {
  final response = await http.get(URL);
  return response.body;
}

Future<Schedule> getNetworkSchedule() async {
  return parseSchedule(decode(await fetchData()));
}
