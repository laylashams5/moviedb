class MovieModel {
  final bool adult;
  final String? backdropPath;
  final int budget;
  final List<Genre> genres;
  final String? homepage;
  final int id;
  final String? imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final List<ProductionCountry> productionCountries;
  final String? releaseDate;
  final int revenue;
  final int runtime;
  final String status;
  final String title;
  final double voteAverage;
  final int voteCount;

  MovieModel({
    required this.adult,
    this.backdropPath,
    required this.budget,
    required this.genres,
    this.homepage,
    required this.id,
    this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    required this.productionCountries,
    this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.status,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'],
      budget: json['budget'] ?? 0,
      genres: (json['genres'] as List? ?? [])
          .map((genreJson) => Genre.fromJson(genreJson))
          .toList(),
      homepage: json['homepage'],
      id: json['id'] ?? 0,
      imdbId: json['imdb_id'],
      originalLanguage: json['original_language'] ?? 'Unknown',
      originalTitle: json['original_title'] ?? 'Unknown',
      overview: json['overview'] ?? '',
      popularity: json['popularity']?.toDouble() ?? 0.0,
      posterPath: json['poster_path'],
      productionCountries: (json['production_countries'] as List? ?? [])
          .map((countryJson) => ProductionCountry.fromJson(countryJson))
          .toList(),
      releaseDate: json['release_date'],
      revenue: json['revenue'] ?? 0,
      runtime: json['runtime'] ?? 0,
      status: json['status'] ?? 'Unknown',
      title: json['title'] ?? 'Unknown',
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
    );
  }
}

class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }
}

class ProductionCountry {
  final String iso3166_1;
  final String name;

  ProductionCountry({required this.iso3166_1, required this.name});

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    return ProductionCountry(
      iso3166_1: json['iso_3166_1'],
      name: json['name'],
    );
  }
}
