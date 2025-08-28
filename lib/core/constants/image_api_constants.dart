class ImageApiConstants {
  static const String baseUrl = "https://image.tmdb.org/t/p/w500";

  static String getImage(String path) => "$baseUrl$path";
}
