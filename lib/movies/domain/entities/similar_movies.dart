import 'package:equatable/equatable.dart';

class SimilarMoviesEntity extends Equatable {
  final int id;
  final String? posterPath;
  final String title;

  const SimilarMoviesEntity({
    required this.title,
    required this.id,
    this.posterPath,
  });

  @override
  List<Object?> get props => [title, id, posterPath];
}
