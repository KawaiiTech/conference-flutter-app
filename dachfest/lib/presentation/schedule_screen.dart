import 'package:dachfest/data/mock_data.dart';
import 'package:dachfest/domain/domain.dart';
import 'package:dachfest/presentation/talk_list_row.dart';
import 'package:flutter/material.dart';

class ScheduleScreen extends StatefulWidget {
  ScheduleScreen();

  @override
  ScheduleScreenState createState() {
    return new ScheduleScreenState();
  }
}

class ScheduleScreenState extends State<ScheduleScreen> {
  int _currentIndex = 0;

  // TODO use this
  Schedule _schedule = mockSchedule;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TalksScreen"),
      ),
      body: Container(),
// TODO
//      ListView.builder(
//        itemCount: talks.length,
//        itemBuilder: (BuildContext context, int index) => TalkListRow(
//              talks[index],
//            ),
//      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.android),
            title: Text("Day 1"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.android),
            title: Text("Day 2"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text("Info"),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
