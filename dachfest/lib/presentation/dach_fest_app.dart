import 'package:dachfest/data/mock_data.dart';
import 'package:dachfest/presentation/schedule_screen.dart';
import 'package:flutter/material.dart';

class DachFestApp extends StatefulWidget {
  @override
  DachFestAppState createState() {
    return DachFestAppState();
  }
}

class DachFestAppState extends State<DachFestApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScheduleScreen(),
    );
  }
}
