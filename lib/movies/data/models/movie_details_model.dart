import 'package:watchly/movies/data/models/genre_model.dart';
import 'package:watchly/movies/domain/entities/movie_details_entity.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  const MovieDetailsModel({
    required super.genres,
    required super.id,
    required super.backdropPath,
    required super.overview,
    required super.title,
    required super.voteAverage,
    required super.runtime,
    required super.releaseDate,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['id'],
      title: json['title'],
      backdropPath: json['backdrop_path'],
      genres: List<GenreModel>.from(
        json['genres'].map((g) => GenreModel.fromJson(g)),
      ),
      overview: json['overview'],
      runtime: json['runtime'],
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      releaseDate: json['release_date'],
    );
  }
}
