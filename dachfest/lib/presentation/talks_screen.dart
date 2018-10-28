import 'package:dachfest/data/local_data.dart';
import 'package:dachfest/presentation/talk_row.dart';
import 'package:flutter/material.dart';

class TalksScreen extends StatefulWidget {
  @override
  TalksScreenState createState() {
    return new TalksScreenState();
  }
}

class TalksScreenState extends State<TalksScreen> {
  int _currentIndex = 0;

  final List<Talk> talks = [
    Talk(
        time: "10:00",
        title: "Sketchnoting Workshop",
        author: "Miquel and Lara"),
    Talk(
        time: "10:00",
        title: "Sketchnoting Workshop",
        author: "Miquel and Lara"),
    Talk(
        time: "10:00",
        title: "Sketchnoting Workshop",
        author: "Miquel and Lara"),
    Talk(
        time: "10:00",
        title: "Sketchnoting Workshop",
        author: "Miquel and Lara"),
    Talk(
        time: "10:00",
        title: "Sketchnoting Workshop",
        author: "Miquel and Lara"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TalksScreen"),
      ),
      body: ListView.builder(
        itemCount: talks.length,
        itemBuilder: (BuildContext context, int index) => TalkListRow(
              talks[index],
            ),
      ),
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
