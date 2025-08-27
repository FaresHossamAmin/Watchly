// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:watchly/core/errors/failure.dart';
import 'package:watchly/core/usecase/base_usecase.dart';
import 'package:watchly/movies/domain/entities/similar_movies.dart';
import 'package:watchly/movies/domain/repositories/base_movie_repository.dart';

class GetSimilarMoviesUseCase
    extends BaseUsecase<List<SimilarMoviesEntity>, SimiarMoviePar> {
  final BaseMovieRepository baseMovieRepository;
  GetSimilarMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<SimilarMoviesEntity>>> call(
    SimiarMoviePar p,
  ) async {
    return await baseMovieRepository.repoGetSimilar(p);
  }
}

class SimiarMoviePar extends Equatable {
  final int movieId;

  const SimiarMoviePar({required this.movieId});

  @override
  List<Object> get props => [id];
}
