import 'package:watchly/movies/domain/entities/similar_movies.dart';

class SimilarMoviesModel extends SimilarMoviesEntity {
  const SimilarMoviesModel({
    required super.title,
    required super.id,
    super.posterPath,
  });

  factory SimilarMoviesModel.fromJson(Map<String, dynamic> json) {
    return SimilarMoviesModel(
      title: json['title'],
      id: json['id'],
      posterPath: json['poster_path'] ?? "/9Z4msMhKvNp63sOB1ZvxPMPvqz3.jpg",
    );
  }
}
