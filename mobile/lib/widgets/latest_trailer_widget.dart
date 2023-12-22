import 'package:flutter/material.dart';
import 'package:moviedb/screens/video_player_screen.dart';
import 'package:moviedb/theme/app_theme.dart';

import 'dart:ui' as ui;

class LatestTrailerWidget extends StatefulWidget {
  final List<Map<String, String>> trailers;
  final ValueChanged<int> onIndexChanged;
  final int currentPage;

  const LatestTrailerWidget({
    Key? key,
    required this.trailers,
    required this.onIndexChanged,
    required this.currentPage,
  }) : super(key: key);

  @override
  _LatestTrailerWidgetState createState() => _LatestTrailerWidgetState();
}

class _LatestTrailerWidgetState extends State<LatestTrailerWidget> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    var itemWidth = 250.0 + 16.0;
    var index = (_scrollController.offset / itemWidth).round();

    if (index != widget.currentPage) {
      widget.onIndexChanged(index);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.trailers[widget.currentPage]['imageUrl']!),
          fit: BoxFit.cover,
          colorFilter: ui.ColorFilter.mode(
            darkPrimaryColor.withOpacity(0.9),
            BlendMode.darken,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Latest Trailers',
              style: TextStyle(
                color: whiteColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.trailers.length,
              controller: _scrollController,
              itemBuilder: (context, index) {
                final trailer = widget.trailers[index];

                return Container(
                  width: 250,
                  height: 300,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(trailer['imageUrl']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 8,
                        left: 15,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Text(
                                trailer['title']!,
                                style: const TextStyle(
                                  color: whiteColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text(
                                trailer['subtitle']!,
                                style: const TextStyle(
                                  color: whiteColor,
                                  fontSize: 12,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            )
                          ],
                        ),
                      ),
                      Center(
                          child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: withoutColor,
                            builder: (BuildContext context) {
                              return FractionallySizedBox(
                                heightFactor: 0.6,
                                child: VideoPlayerScreen(
                                    thumbnailUrl: trailer['imageUrl']!,
                                    videoUrl: trailer['videoUrl']!,
                                    title: trailer['title']!),
                              );
                            },
                          );
                        },
                        child: Icon(
                          Icons.play_arrow,
                          color: whiteColor.withOpacity(0.7),
                          size: 45,
                        ),
                      )),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
