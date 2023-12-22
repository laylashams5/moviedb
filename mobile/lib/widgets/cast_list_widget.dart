import 'package:flutter/material.dart';
import 'package:moviedb/theme/app_theme.dart';

class CastList extends StatelessWidget {
  final List<Map<String, String>> cast;

  const CastList({
    Key? key,
    required this.cast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cast.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 120,
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(cast[index]['imageUrl']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  cast[index]['name']!,
                  style: const TextStyle(
                    color: whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  cast[index]['character']!,
                  style: const TextStyle(
                    color: whiteColor,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
