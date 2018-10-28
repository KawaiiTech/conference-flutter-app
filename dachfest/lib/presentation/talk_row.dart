import 'package:dachfest/domain/domain.dart';
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
        Text(""),
        Text(talk.title),
        Text(""),
      ],
    );
  }
}
