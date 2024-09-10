import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/models/stats_model.dart';

class Stats extends StatefulWidget {
  const Stats({super.key});

  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  List<StatsModel> statsData = [];

  @override
  void initState() {
    super.initState();
    _getStats();
  }

  void _getStats() {
    setState(() {
      statsData = StatsModel.getStats();
    });
  }

  @override
  Widget build(BuildContext context) {
    return _statsCarousel();
  }

  Column _statsCarousel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // const SizedBox(height: 0),
        Container(
          height: 200,
          child: statsData.isEmpty
              ? Center(child: CircularProgressIndicator()) // Show a loading indicator
              : ListView.separated(
            itemCount: statsData.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 25),
            separatorBuilder: (context, index) => const SizedBox(width: 25),
            itemBuilder: (context, index) {
              return SvgPicture.asset(
                statsData[index].iconPath,
                height: 141,
                width: 310,
              );
            },
          ),
        ),
      ],
    );
  }
}
