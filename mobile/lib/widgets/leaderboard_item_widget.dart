import 'package:flutter/material.dart';
import 'package:moviedb/theme/app_theme.dart';

class LeaderboardItemWidget extends StatelessWidget {
  final String initial;
  final String name;
  final int allTimeEdits;
  final int editsThisWeek;

  const LeaderboardItemWidget({
    Key? key,
    required this.initial,
    required this.name,
    required this.allTimeEdits,
    required this.editsThisWeek,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxBarWidth = MediaQuery.of(context).size.width - 150;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: greyColor,
            child: Text(initial, style: const TextStyle(color: blackColor)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Stack(
                  children: [
                    Container(
                      width: maxBarWidth,
                      height: 10,
                      decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    Container(
                      width: maxBarWidth *
                          (allTimeEdits / (allTimeEdits + editsThisWeek)),
                      height: 10,
                      decoration: BoxDecoration(
                        color: darkPrimaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        width: maxBarWidth *
                            (editsThisWeek / (allTimeEdits + editsThisWeek)),
                        height: 10,
                        decoration: BoxDecoration(
                          color: accentColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Text(editsThisWeek.toString()),
        ],
      ),
    );
  }
}
