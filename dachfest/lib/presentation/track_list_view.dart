import 'package:dachfest/domain/domain.dart';
import 'package:dachfest/presentation/talk_view.dart';
import 'package:flutter/material.dart';

class TrackListView extends StatelessWidget {
  final Track track;

  TrackListView(this.track) : assert(track != null);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return getTalkWidget(index);
      },
      itemCount: track.talks.length,
    );
  }

  Widget getTalkWidget(int position) {
    return TalkView(track.talks[position]);
  }
}
