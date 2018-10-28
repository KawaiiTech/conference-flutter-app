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
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            expandedHeight: 150.0,
          ),
          SliverPadding(
            padding: EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    talk.title,
                    style: TextStyle(fontSize: 20.0),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(talk.description),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
