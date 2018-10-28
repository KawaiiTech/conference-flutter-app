import 'package:dachfest/data/local_data.dart';
import 'package:dachfest/domain/talk.dart';
import 'package:dachfest/presentation/talk_row.dart';
import 'package:flutter/material.dart';

class TalksScreen extends StatefulWidget {
  @override
  TalksScreenState createState() {
    return new TalksScreenState();
  }
}

class TalksScreenState extends State<TalksScreen> {
  Schedule talks = [];

  @override
  void initState() {
    super.initState();
    getAllTalks(context).then((talks) {
      setState(() {
        this.talks = talks;
      });
    }, onError: (error) {
      print(error);
    });
  }

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
    );
  }
}
