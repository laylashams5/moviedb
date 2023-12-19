import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moviedb/helpers/app_constants.dart';
import 'package:moviedb/theme/app_theme.dart';
import 'package:moviedb/widgets/custom_app_bar.dart';
import 'package:moviedb/widgets/drawer_widget.dart';
import 'package:moviedb/widgets/movie_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  bool isDrawerOpen = false;
  final List<Map<String, dynamic>> movies = [
    {
      'posterUrl': 'https://via.placeholder.com/150',
      'title': 'The Family Plan',
      'releaseDate': 'Dec 14, 2023',
      'rating': 7.6,
    },
    {
      'posterUrl': 'https://via.placeholder.com/150',
      'title': 'The Family Plan',
      'releaseDate': 'Dec 14, 2023',
      'rating': 7.6,
    },
    {
      'posterUrl': 'https://via.placeholder.com/150',
      'title': 'The Family Plan',
      'releaseDate': 'Dec 14, 2023',
      'rating': 7.6,
    },
    {
      'posterUrl': 'https://via.placeholder.com/150',
      'title': 'The Family Plan',
      'releaseDate': 'Dec 14, 2023',
      'rating': 7.6,
    },
    {
      'posterUrl': 'https://via.placeholder.com/150',
      'title': 'The Family Plan',
      'releaseDate': 'Dec 14, 2023',
      'rating': 7.6,
    },
  ];
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  void toggleDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: whiteColor,
        drawer: const DrawerWidget(),
        appBar: CustomAppBar(toggleDrawer: toggleDrawer),
        body: SafeArea(
            child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          AppConstants.backgroundImage,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: RichText(
                            textAlign: TextAlign.left,
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.normal,
                                color: whiteColor,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Welcome.\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 26,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'Millions of movies, TV shows and people to discover. Explore now.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search...',
                                hintStyle: TextStyle(
                                    color: blackColor.withOpacity(0.5)),
                                suffixIcon: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.0),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color.fromRGBO(30, 213, 169, 1),
                                        Color.fromRGBO(1, 180, 228, 1),
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(50.0),
                                    onTap: () {},
                                    child: const Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Search',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 10.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    )),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Discover',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        AppConstants.backgroundMovieImage,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      final movie = movies[index];

                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: MovieCard(
                          moviePosterUrl: movie['posterUrl'],
                          movieTitle: movie['title'],
                          movieReleaseDate: movie['releaseDate'],
                          movieRating: movie['rating'],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // AnimatedBuilder(
          //   animation: _animationController,
          //   builder: (context, _) {
          //     double slide =
          //         screenWidth * 0.9 * (1 - _animationController.value);
          //     return Positioned(
          //       top: 0,
          //       bottom: 0,
          //       left: slide - screenWidth * 0.9,
          //       child: const DrawerWidget(),
          //     );
          //   },
          // ),
        ])));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
