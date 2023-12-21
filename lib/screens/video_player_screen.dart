import 'package:flutter/material.dart';
import 'package:moviedb/theme/app_theme.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  final String title;
  final String thumbnailUrl;

  const VideoPlayerScreen({
    Key? key,
    required this.videoUrl,
    required this.title,
    required this.thumbnailUrl,
  }) : super(key: key);

  @override
  VideoPlayerScreenState createState() => VideoPlayerScreenState();
}

class VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(10),
      backgroundColor: withoutColor,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          color: darkPrimaryColor.withOpacity(0.9),
          child: Column(
            children: [
              _buildTopBar(),
              _buildVideoThumbnail(),
              _buildPlayButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: const TextStyle(color: whiteColor, fontSize: 18),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: whiteColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoThumbnail() {
    return Expanded(
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : Image.network(
              widget.thumbnailUrl,
              fit: BoxFit.cover,
              width: 250,
              height: 300,
            ),
    );
  }

  Widget _buildPlayButton() {
    return Center(
      child: IconButton(
        iconSize: 64,
        icon: Icon(
          _isPlaying ? Icons.pause : Icons.play_arrow,
          color: whiteColor,
        ),
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
              _isPlaying = false;
            } else {
              _controller.play();
              _isPlaying = true;
            }
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
