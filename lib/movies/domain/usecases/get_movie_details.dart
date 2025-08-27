import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:watchly/core/errors/failure.dart';
import 'package:watchly/core/usecase/base_usecase.dart';
import 'package:watchly/movies/domain/entities/movie_details_entity.dart';
import 'package:watchly/movies/domain/repositories/base_movie_repository.dart';

class GetMovieDetailsUseCase
    extends BaseUsecase<MovieDetailsEntity, MovieDetailsPar> {
  final BaseMovieRepository baseMovieRepository;
  GetMovieDetailsUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, MovieDetailsEntity>> call(
    MovieDetailsPar movieDetailsPar,
  ) async {
    return await baseMovieRepository.repoGetDetails(movieDetailsPar);
  }
}

class MovieDetailsPar extends Equatable {
  final int movieId;

  const MovieDetailsPar({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}
