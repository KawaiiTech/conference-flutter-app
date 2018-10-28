import 'package:dachfest/domain/domain.dart';
import 'package:flutter/material.dart';

class TalkDetailsScreen extends StatelessWidget {
  final Talk talk;

  TalkDetailsScreen({this.talk}) : assert(talk != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              title: Text(
                talk.title,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            expandedHeight: 150.0,
          ),
          SliverPadding(
            padding: EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    talk.title,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    talk.description ?? "",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
                buildSpeakersList(context),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSpeakersList(BuildContext context) {
    if (talk.speakers.length == 0) {
      return Container();
    }
    List<Widget> widgets = [
      Padding(
        padding: const EdgeInsets.only(
          top: 16.0,
          bottom: 8.0,
        ),
        child: Text(
          "Speakers",
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    ];
    for (var i = 0; i < talk.speakers.length; i++) {
      widgets.add(Row(
        children: <Widget>[
          CircleAvatar(
            radius: 50.0,
            backgroundColor: Theme.of(context).primaryColorLight,
            backgroundImage: NetworkImage(
              "https://dachfest.com/images/people/speakers/${talk.speakers[i].id}.jpg",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              talk.speakers[i].name,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
}
