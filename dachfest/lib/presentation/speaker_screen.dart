import 'package:dachfest/domain/domain.dart';
import 'package:flutter/material.dart';

class SpeakerScreen extends StatelessWidget {
  final Speaker speaker;

  SpeakerScreen({this.speaker}) : assert(speaker != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(speaker.name),
      ),
    );
  }
}
