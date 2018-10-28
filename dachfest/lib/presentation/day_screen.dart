import 'package:dachfest/domain/domain.dart';
import 'package:dachfest/presentation/day_grid.dart';
import 'package:flutter/material.dart';

class DayScreen extends StatelessWidget {
  final Day day;

  DayScreen(this.day) : assert(day != null);

  @override
  Widget build(BuildContext context) {
    return DayGrid(day);
  }
}
