import 'package:dachfest/domain/talk.dart';
import 'package:flutter/material.dart';

class TalkListRow extends StatelessWidget {
  final Talk talk;

  TalkListRow(
    this.talk,
  ) : assert(talk != null);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(talk.time),
        Text(talk.title),
        Text(talk.author),
      ],
    );
  }
}
