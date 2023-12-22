import 'package:flutter/material.dart';
import 'package:moviedb/helpers/app_constants.dart';
import 'package:moviedb/models/movie_model.dart';
import 'package:moviedb/services/api_service.dart';

class MovieListProvider extends ChangeNotifier {
  List<MovieModel> movieList = [];
  final apiService = ApiService();
  Future<void> getMovieList() async {
    try {
      final movieListresult = await apiService.getData(
          '/movie/popular?api_key=${AppConstants.apiKey}', '');
      if (movieListresult['results'] is List) {
        movieList = (movieListresult['results'] as List)
            .map((data) => MovieModel.fromJson(data))
            .toList();
      }
      notifyListeners();
    } catch (e) {
      throw Exception('Error$e');
    }
  }
}
