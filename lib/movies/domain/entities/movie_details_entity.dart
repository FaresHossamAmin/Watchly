import 'package:equatable/equatable.dart';
import 'package:watchly/movies/domain/entities/genre.dart';

class MovieDetailsEntity extends Equatable {
  final int id;
  final String backdropPath;
  final String overview;
  final String title;
  final double voteAverage;
  final int runtime;
  final List<Genre> genres;
  final String releaseDate;

  const MovieDetailsEntity({
    required this.id,
    required this.backdropPath,
    required this.overview,
    required this.title,
    required this.voteAverage,
    required this.runtime,
    required this.genres,
    required this.releaseDate,
  });

  @override
  List<Object> get props {
    return [
      id,
      backdropPath,
      overview,
      title,
      voteAverage,
      runtime,
      genres,
      releaseDate,
    ];
  }
}
