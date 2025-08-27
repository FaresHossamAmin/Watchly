import 'package:dartz/dartz.dart';
import 'package:watchly/core/errors/failure.dart';
import 'package:watchly/movies/domain/entities/movie_details_entity.dart';
import 'package:watchly/movies/domain/entities/movie_entity.dart';
import 'package:watchly/movies/domain/entities/similar_movies.dart';
import 'package:watchly/movies/domain/usecases/get_movie_details.dart';
import 'package:watchly/movies/domain/usecases/get_similar_movies.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<MovieEntity>>> repoPopular();
  Future<Either<Failure, List<MovieEntity>>> repoTopRated();
  Future<Either<Failure, List<MovieEntity>>> repoNowPlaying();
  Future<Either<Failure, MovieDetailsEntity>> repoGetDetails(MovieDetailsPar p);
  Future<Either<Failure, List<SimilarMoviesEntity>>> repoGetSimilar(
    SimiarMoviePar p,
  );
}
