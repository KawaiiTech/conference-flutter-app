import 'package:dachfest/domain/domain.dart';
import 'package:flutter/material.dart';

class TalkView extends StatelessWidget {
  final Talk talk;

  TalkView(
    this.talk,
  ) : assert(talk != null);

  @override
  Widget build(BuildContext context) {
    if (talk.id.isEmpty) {
      return Container();
    }
    return Container(
      height: 100.0,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                talk.title,
                style: TextStyle(fontSize: 18.0),
                softWrap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
