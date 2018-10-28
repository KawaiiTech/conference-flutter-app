import 'package:dachfest/domain/domain.dart';
import 'package:flutter/material.dart';

class TalkDetailsScreen extends StatelessWidget {

  final Talk talk;

  TalkDetailsScreen({this.talk}) : assert (talk != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(talk.title),
      ),
    );
  }
}
