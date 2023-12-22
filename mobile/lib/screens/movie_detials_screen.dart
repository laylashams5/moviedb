import 'package:flutter/material.dart';
import 'package:moviedb/models/movie_model.dart';
import 'package:moviedb/theme/app_theme.dart';
import 'package:moviedb/widgets/cast_list_widget.dart';
import 'package:moviedb/widgets/custom_app_bar_widget.dart';
import 'package:moviedb/widgets/drawer_widget.dart';
import 'package:palette_generator/palette_generator.dart';

class MovieDetailsScreen extends StatefulWidget {
  final MovieModel movieData;

  const MovieDetailsScreen({Key? key, required this.movieData})
      : super(key: key);

  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Color backgroundColor = primaryColor;
  PaletteGenerator? paletteGenerator;
  final recommendations = [
    {
      'imageUrl':
          'https://image.tmdb.org/t/p/w500/feSiISwgEpVzR1v3zv2n2AU4ANJ.jpg',
      'title': 'A Haunting in Venice',
      'score': '68%'
    },
    {
      'imageUrl':
          'https://image.tmdb.org/t/p/w500/1X7vow16X7CnCoexXh4H4F2yDJv.jpg',
      'title': 'The Hunger Games',
      'score': '72%'
    },
    {
      'imageUrl':
          'https://image.tmdb.org/t/p/w500/gN79aDbZdaSJkFS1iVA17HplF2X.jpg',
      'title': 'The Hunger Games',
      'score': '72%'
    },
  ];
  final List<Map<String, String>> cats = [
    {
      'name': 'Tom Blyth',
      'character': 'Coriolanus Snow',
      'imageUrl':
          'https://image.tmdb.org/t/p/w500/ar33qcWbEgREn07ZpXv5Pbj8hbM.jpg',
    },
    {
      'name': 'Rachel Zegler',
      'character': 'Lucy Gray Baird',
      'imageUrl':
          'https://image.tmdb.org/t/p/w500/cBMtncBcUrKMTB8CifDG23THuCE.jpg',
    },
    {
      'name': 'Peter Dinklage',
      'character': 'Casca Highbottom',
      'imageUrl':
          'https://image.tmdb.org/t/p/w500/r17jFHAemzcWPPtoO0UxjIX0xas.jpg',
    },
  ];
  final String backgroundImageUrl =
      'https://image.tmdb.org/t/p/w500/fPer2U4uQT1dkXTUWODDaLECWoW.jpg';
  final String collectionTitle = 'Part of the Captain Marvel Collection';

  @override
  void initState() {
    super.initState();
    _updatePaletteGenerator(widget.movieData.posterPath!);
  }

  void _updatePaletteGenerator(String imageUrl) async {
    print('image $imageUrl');
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage('https://image.tmdb.org/t/p/w500/$imageUrl'),
      size: const Size(110, 150),
    );
    if (paletteGenerator != null && paletteGenerator!.colors.isNotEmpty) {
      setState(() {
        backgroundColor = paletteGenerator!.colors.first;
      });
    }
  }

  void toggleDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final String title = widget.movieData.title;
    final String posterUrl = widget.movieData.posterPath!;
    final double rating = widget.movieData.voteAverage;
    final String releaseDate = widget.movieData.releaseDate!;
    final String overview = widget.movieData.overview;

    final progress = widget.movieData.voteAverage / 10.0;
    return Scaffold(
      backgroundColor: backgroundColor,
      key: _scaffoldKey,
      drawer: const DrawerWidget(),
      appBar: CustomAppBarWidget(toggleDrawer: toggleDrawer),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500/$posterUrl'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        backgroundColor.withOpacity(0.5),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 16.0,
                  top: 10,
                  bottom: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500/$posterUrl'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      backgroundBlendMode: BlendMode.darken,
                      gradient: LinearGradient(
                        colors: [backgroundColor, blackColor.withOpacity(0.5)],
                        stops: const [0.0, 1.0],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                  color: whiteColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: blackColor,
                                        borderRadius:
                                            BorderRadius.circular(50.0)),
                                    height: 35,
                                    width: 35,
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        CircularProgressIndicator(
                                          value: progress,
                                          backgroundColor:
                                              lightBlackColor.withOpacity(0.5),
                                          valueColor:
                                              const AlwaysStoppedAnimation<
                                                  Color>(accentColor),
                                          strokeWidth: 4,
                                        ),
                                        Center(
                                          child: Text(
                                            '${(rating * 10).toInt()}%',
                                            style: const TextStyle(
                                                color: whiteColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8.0),
                                  const Text(
                                    'User Score',
                                    style: TextStyle(
                                        color: whiteColor, fontSize: 16.0),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8.0),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Play Trailer',
                                  style: TextStyle(color: whiteColor),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    releaseDate,
                                    style: const TextStyle(
                                        color: whiteColor, fontSize: 16.0),
                                  ),
                                  const Text(
                                    '|',
                                    style: TextStyle(color: greyColor),
                                  ),
                                  const Text(
                                    'Comdey, Action, Thriller',
                                    style: TextStyle(
                                        color: whiteColor, fontSize: 16.0),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.play_circle_fill,
                              color: whiteColor, size: 40),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Everyone hungers for something.',
                              style: TextStyle(color: greyColor)),
                          const SizedBox(
                            height: 5.0,
                          ),
                          const Text(
                            'Overview',
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            overview,
                            style: const TextStyle(
                                color: whiteColor, fontSize: 16.0),
                          ),
                          const SizedBox(height: 16.0),
                          const Text(
                            'Top Billed Cast',
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          CastList(cast: cats),
                          Container(
                            margin: const EdgeInsets.only(top: 20.0),
                            height: 200,
                            decoration: BoxDecoration(
                              color: darkPrimaryColor,
                              image: DecorationImage(
                                image: NetworkImage(backgroundImageUrl),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  blackColor.withOpacity(0.5),
                                  BlendMode.darken,
                                ),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 16,
                                  right: 16,
                                  bottom: 16,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        collectionTitle,
                                        style: const TextStyle(
                                          color: whiteColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Container(
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          gradient: const LinearGradient(
                                            colors: [
                                              secondaryColor,
                                              accentColor
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ),
                                        ),
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: withoutColor,
                                            elevation: 0.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                          ),
                                          child: const Text(
                                            'VIEW THE COLLECTION',
                                            style: TextStyle(color: whiteColor),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Recommendations',
                                  style: TextStyle(
                                      fontSize: 20.0, color: whiteColor),
                                ),
                                const SizedBox(height: 10),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children:
                                        recommendations.map((recommendation) {
                                      return Container(
                                        width: 140,
                                        decoration: BoxDecoration(
                                            color: greyColor,
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        padding: const EdgeInsets.only(
                                          bottom: 5.0,
                                        ),
                                        margin:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Column(
                                          children: [
                                            Image.network(
                                              recommendation['imageUrl']!,
                                              fit: BoxFit.cover,
                                            ),
                                            Text(
                                              recommendation['title']!,
                                              style: const TextStyle(
                                                  color: blackColor),
                                            ),
                                            Text(
                                              recommendation['score']!,
                                              style: const TextStyle(
                                                  color: blackColor),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
