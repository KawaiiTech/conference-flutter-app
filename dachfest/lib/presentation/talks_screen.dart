import 'package:dachfest/data/talk.dart';
import 'package:dachfest/presentation/talk_row.dart';
import 'package:flutter/material.dart';

class TalksScreen extends StatelessWidget {
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
        itemBuilder: (BuildContext context, int index) =>
            TalkListRow(
              talks[index],
            ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
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
      ]));
  }
}
