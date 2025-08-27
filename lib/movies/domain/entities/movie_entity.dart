import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final String posterPath;
  final String releaseDate;
  final List<int> genreIds;
  final String overview;
  final double voteAverage;

  const MovieEntity({
    required this.posterPath,
    required this.releaseDate,
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genreIds,
    required this.overview,
    required this.voteAverage,
  });
  @override
  List<Object?> get props => [
    posterPath,
    releaseDate,
    id,
    title,
    backdropPath,
    genreIds,
    overview,
    voteAverage,
  ];
}
