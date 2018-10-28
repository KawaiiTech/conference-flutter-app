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
      theme: ThemeData(
        primaryColor: Color(0xFF673ab7),
        accentColor: Color(0xFFFFA726),
      ),
    );
  }
}
