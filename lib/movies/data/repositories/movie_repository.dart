import 'package:dartz/dartz.dart';
import 'package:watchly/core/errors/exception.dart';
import 'package:watchly/core/errors/failure.dart';
import 'package:watchly/movies/data/datasources/remote_datasource.dart';
import 'package:watchly/movies/domain/entities/movie_details_entity.dart';
import 'package:watchly/movies/domain/entities/movie_entity.dart';
import 'package:watchly/movies/domain/entities/similar_movies.dart';
import 'package:watchly/movies/domain/repositories/base_movie_repository.dart';
import 'package:watchly/movies/domain/usecases/get_movie_details.dart';
import 'package:watchly/movies/domain/usecases/get_similar_movies.dart';

class MovieRepository extends BaseMovieRepository {
  final BaseRemoteDataSource baseRemoteDataSource;
  MovieRepository(this.baseRemoteDataSource);

  Future<Either<Failure, List<MovieEntity>>> _fetchMovies(
    Future<List<MovieEntity>> Function() fetchFunction,
  ) async {
    try {
      final result = await fetchFunction();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> repoNowPlaying() {
    return _fetchMovies(() => baseRemoteDataSource.getNowPlayingMovies());
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> repoPopular() {
    return _fetchMovies(() => baseRemoteDataSource.getPopularMovies());
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> repoTopRated() {
    return _fetchMovies(() => baseRemoteDataSource.getTopRatedMovies());
  }

  @override
  Future<Either<Failure, MovieDetailsEntity>> repoGetDetails(
    MovieDetailsPar p,
  ) async {
    final result = await baseRemoteDataSource.getMovieDetails(p);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<SimilarMoviesEntity>>> repoGetSimilar(
    SimiarMoviePar p,
  ) async {
    final result = await baseRemoteDataSource.getSimilarMovies(p);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
