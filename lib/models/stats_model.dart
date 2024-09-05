import 'package:flutter/material.dart';

class StatsModel {
  String iconPath;

  StatsModel({
    required this.iconPath,
  });

  static List<StatsModel> getStats(){
    List<StatsModel> stats = [];

    stats.add(StatsModel(iconPath: 'assets/icons/Numbers1.svg'));
    stats.add(StatsModel(iconPath: 'assets/icons/Numbers2.svg'));
    stats.add(StatsModel(iconPath: 'assets/icons/Numbers3.svg'));
    stats.add(StatsModel(iconPath: 'assets/icons/Numbers4.svg'));

    return stats;
  }
}