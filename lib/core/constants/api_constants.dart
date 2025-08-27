class ApiConstants {
  static const String movieBaseUrl = "https://api.themoviedb.org/3/movie";
  static const String showBaseUrl = "https://api.themoviedb.org/3/tv";
  static const String apiKeyParam = "?api_key=49b53bd8106ac77b5fe863fa9ee58773";
  static const String now = "/now_playing";
  static const String pop = "/popular";
  static const String top = "/top_rated";

  static const String imageBaseUrl = "https://image.tmdb.org/t/p/w500";

  static String movieListPath(String endpoint) =>
      "${ApiConstants.movieBaseUrl}$endpoint${ApiConstants.apiKeyParam}";
  static String movieDetailsPath(movieId) =>
      "${ApiConstants.movieBaseUrl}/$movieId${ApiConstants.apiKeyParam}";

  static String movieSimilarPath(movieId) =>
      "${ApiConstants.movieBaseUrl}/$movieId/similar${ApiConstants.apiKeyParam}";

  static String getImage(String path) => "$imageBaseUrl$path";
}
