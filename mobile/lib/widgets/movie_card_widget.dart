import 'package:flutter/material.dart';
import 'package:moviedb/helpers/app_constants.dart';
import 'package:moviedb/helpers/common.dart';
import 'package:moviedb/theme/app_theme.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
    required this.moviePosterUrl,
    required this.movieTitle,
    required this.movieReleaseDate,
    required this.movieRating,
  }) : super(key: key);

  final String moviePosterUrl;
  final String movieTitle;
  final String movieReleaseDate;
  final double movieRating;

  @override
  Widget build(BuildContext context) {
    final progress = movieRating / 10.0;

    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: FadeInImage.assetNetwork(
                    placeholder: AppConstants.placeholderImage,
                    image: moviePosterUrl.isNotEmpty
                        ? 'https://image.tmdb.org/t/p/w500/$moviePosterUrl'
                        : AppConstants.placeholderImage,
                    width: 150,
                    height: 225,
                    fit: BoxFit.cover,
                    placeholderFit: BoxFit.cover,
                  )),
              Positioned(
                bottom: 8,
                left: 8,
                child: Container(
                  decoration: BoxDecoration(
                      color: blackColor,
                      borderRadius: BorderRadius.circular(50.0)),
                  height: 35,
                  width: 35,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircularProgressIndicator(
                        value: progress,
                        backgroundColor: lightBlackColor.withOpacity(0.5),
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(accentColor),
                        strokeWidth: 4,
                      ),
                      Center(
                        child: Text(
                          '${(movieRating * 10).toInt()}%',
                          style: const TextStyle(
                              color: whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
            child: Text(
              movieTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 5.0),
            child: Text(
              convertDateString(movieReleaseDate),
              style: TextStyle(
                color: blackColor.withOpacity(0.5),
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
