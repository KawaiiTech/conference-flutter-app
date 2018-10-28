import 'dart:io';

import 'package:dachfest/data/local_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Load JSON from file', () async {

    final file = new File('data_repo/dachfest-2018.json');
    final data = decode(await file.readAsString());
    expect(data.isNotEmpty, true);
  });

}
