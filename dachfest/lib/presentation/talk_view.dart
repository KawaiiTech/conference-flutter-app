import 'package:dachfest/domain/domain.dart';
import 'package:dachfest/presentation/talk_details_screen.dart';
import 'package:flutter/material.dart';

class TalkView extends StatelessWidget {
  final Talk talk;

  TalkView(
    this.talk,
  ) : assert(talk != null);

  @override
  Widget build(BuildContext context) {

    if (talk.title == null) {
      return Container(
        height: talk.height,
      );
    }

    return Container(
      height: talk.height,
      child: Card(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TalkDetailsScreen(
                  talk: talk,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  talk.title,
                  style: TextStyle(fontSize: 18.0),
                  softWrap: true,
                  maxLines: 2,
                ),
                buildSpeakersRow()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSpeakersRow() {
    var style = TextStyle(fontSize: 12.0, color: Colors.grey);
//    var num = talk.speakers.length;
    var num = 0;
    switch (num) {
      case 0:
        return Container();
      case 1:
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              talk.speakers[0].name,
              style: style,
            ),
//            FlutterLogo(),
          ],
        );
      default:
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              "Several Speakers!",
              style: style,
            ),
//            Icon(Icons.tag_faces),
          ],
        );
    }
  }
}

