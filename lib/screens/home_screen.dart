import 'package:flutter/material.dart';
import 'package:moviedb/helpers/app_constants.dart';
import 'package:moviedb/helpers/check_connectivity.dart';
import 'package:moviedb/helpers/dialog_helper.dart';
import 'package:moviedb/helpers/slide_route.dart';
import 'package:moviedb/localization/app_localizations.dart';
import 'package:moviedb/models/movie_model.dart';
import 'package:moviedb/providers/movie_list_provider.dart';
import 'package:moviedb/screens/movie_detials_screen.dart';
import 'package:moviedb/services/api_service.dart';
import 'package:moviedb/theme/app_theme.dart';
import 'package:moviedb/widgets/custom_app_bar_widget.dart';
import 'package:moviedb/widgets/custom_popup_menu_widget.dart';
import 'package:moviedb/widgets/drawer_widget.dart';
import 'package:moviedb/widgets/latest_trailer_widget.dart';
import 'package:moviedb/widgets/leaderboard_item_widget.dart';
import 'package:moviedb/widgets/movie_card_widget.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final List<MovieModel> movies = [];
  final List<Map<String, String>> trailers = [
    {
      'title': 'SPY x FAMILY',
      'subtitle': 'Season 2 Finale Trailer [Subtitled]',
      'imageUrl':
          'https://image.tmdb.org/t/p/w500/yOm993lsJyPmBodlYjgpPwBjXP9.jpg',
      'videoUrl':
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
    },
    {
      'title': 'SPY x FAMILY',
      'subtitle': 'Season 2 Finale Trailer [Subtitled]',
      'imageUrl':
          'https://image.tmdb.org/t/p/w500/rMvPXy8PUjj1o8o1pzgQbdNCsvj.jpg',
      'videoUrl':
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
    },
    {
      'title': 'SPY x FAMILY',
      'subtitle': 'Season 2 Finale Trailer [Subtitled]',
      'imageUrl':
          'https://image.tmdb.org/t/p/w500/uOvcyJ3XmUv4geypGvZBeZEFMO6.jpg',
      'videoUrl':
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
    },
    {
      'title': 'SPY x FAMILY',
      'subtitle': 'Season 2 Finale Trailer [Subtitled]',
      'imageUrl':
          'https://image.tmdb.org/t/p/w500/3y72ffwYRUPOj4yOQbiTaN897Tm.jpg',
      'videoUrl':
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
    },
  ];

  final List<Map<String, dynamic>> leaderboardData = [
    {
      'name': 'RuiZafon',
      'initials': 'R',
      'allTimeEdits': 1447579,
      'editsThisWeek': 20462,
    },
    {
      'name': 'Peter-68',
      'initials': 'P',
      'allTimeEdits': 22447,
      'editsThisWeek': 9666,
    },
  ];

  final apiService = ApiService();
  bool isDataLoaded = false;

  @override
  void initState() {
    super.initState();
    if (!isDataLoaded) {
      loadData();
    }
  }

  Future<void> loadData() async {
    setState(() => isDataLoaded = false);
    bool isConnected = await isInternetConnected();
    if (!isConnected) {
      DialogHelper()
          .showErrorMessage(context, AppLocalizations.of(context)!.nointernet);
      setState(() => isDataLoaded = true);

      return;
    }
    Provider.of<MovieListProvider>(context, listen: false).getMovieList();
    setState(() {
      isDataLoaded = true;
    });
  }

  void toggleDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentPage = 0;
  void _onTrailerIndexChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  final List<String> options = ['Today', 'This Week'];
  String selectedOption = 'Today';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: whiteColor,
      drawer: const DrawerWidget(),
      appBar: CustomAppBarWidget(toggleDrawer: toggleDrawer),
      body: SingleChildScrollView(
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
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: whiteColor,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Welcome.\n',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'Millions of movies, TV shows and people to discover. Explore now.',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
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
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            hintStyle:
                                TextStyle(color: blackColor.withOpacity(0.5)),
                            suffixIcon: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                gradient: const LinearGradient(
                                  colors: [
                                    accentColor,
                                    secondaryColor,
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
                                          color: whiteColor,
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
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Text(
                      'Trending',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: darkPrimaryColor),
                    ),
                    CustomPopupMenuWidget(
                      options: const ['Today', 'This Week'],
                      initialValue: 'Today',
                      onSelected: (value) {},
                    )
                  ],
                )),
            Consumer<MovieListProvider>(
                builder: (context, movieListProvider, child) {
              final movies = movieListProvider.movieList;
              return Container(
                height: 300,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(
                      AppConstants.backgroundMovieImage,
                    ),
                    fit: BoxFit.contain,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: whiteColor.withOpacity(0.5),
                      blurRadius: 8.0,
                    ),
                  ],
                ),
                child: !isDataLoaded
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) => _buildShimmerEffect(),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          final movie = movies[index];
                          return Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 0.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    SlideRoute(
                                      screen:
                                          MovieDetailsScreen(movieData: movie),
                                      duration:
                                          const Duration(milliseconds: 500),
                                    ),
                                  );
                                },
                                child: MovieCard(
                                  moviePosterUrl: movie.posterPath!,
                                  movieTitle: movie.title,
                                  movieReleaseDate: movie.releaseDate!,
                                  movieRating: movie.voteAverage,
                                ),
                              ));
                        },
                      ),
              );
            }),
            LatestTrailerWidget(
              trailers: trailers,
              onIndexChanged: _onTrailerIndexChanged,
              currentPage: _currentPage,
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Text(
                      'Free To Watch',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: darkPrimaryColor),
                    ),
                    CustomPopupMenuWidget(
                      options: const ['Movies', 'TV'],
                      initialValue: 'Movies',
                      onSelected: (value) {},
                    )
                  ],
                )),
            Consumer<MovieListProvider>(
                builder: (context, movieListProvider, child) {
              final movies = movieListProvider.movieList;
              return Container(
                height: 300,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(
                      AppConstants.backgroundMovieImage,
                    ),
                    fit: BoxFit.contain,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: whiteColor.withOpacity(0.5),
                      blurRadius: 8.0,
                    ),
                  ],
                ),
                child: !isDataLoaded
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) => _buildShimmerEffect(),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          final movie = movies[index];
                          return Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 0.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    SlideRoute(
                                      screen:
                                          MovieDetailsScreen(movieData: movie),
                                      duration:
                                          const Duration(milliseconds: 500),
                                    ),
                                  );
                                },
                                child: MovieCard(
                                  moviePosterUrl: movie.posterPath!,
                                  movieTitle: movie.title,
                                  movieReleaseDate: movie.releaseDate!,
                                  movieRating: movie.voteAverage,
                                ),
                              ));
                        },
                      ),
              );
            }),
            Padding(
              padding: const EdgeInsets.only(top: 0.0, left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Leaderboard',
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: darkPrimaryColor),
                  ),
                  const SizedBox(height: 8.0),
                  ...leaderboardData.map((user) {
                    return LeaderboardItemWidget(
                      initial: user['initials'],
                      name: user['name'],
                      allTimeEdits: user['allTimeEdits'],
                      editsThisWeek: user['editsThisWeek'],
                    );
                  }).toList(),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: darkPrimaryColor.withOpacity(0.7),
      highlightColor: primaryColor,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 5.0),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        width: 150,
        height: 225,
      ),
    );
  }
}
