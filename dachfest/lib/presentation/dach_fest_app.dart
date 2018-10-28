import 'package:dachfest/presentation/talks_screen.dart';
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
      home: TalksScreen(),
    );
  }
}
