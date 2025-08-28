class MovieApiConstants {
  static const String baseUrl = "https://api.themoviedb.org/3/movie";
  static const String apiKeyParam = "?api_key=49b53bd8106ac77b5fe863fa9ee58773";

  static const String nowPlaying = "/now_playing";
  static const String popular = "/popular";
  static const String topRated = "/top_rated";

  static String listPath(String endpoint) => "$baseUrl$endpoint$apiKeyParam";

  static String detailsPath(int movieId) => "$baseUrl/$movieId$apiKeyParam";

  static String similarPath(int movieId) =>
      "$baseUrl/$movieId/similar$apiKeyParam";
}
