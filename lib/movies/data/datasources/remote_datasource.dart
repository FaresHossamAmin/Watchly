import 'package:dio/dio.dart';
import 'package:watchly/core/constants/api_constants.dart';
import 'package:watchly/core/errors/exception.dart';
import 'package:watchly/core/network/error_message_model.dart';
import 'package:watchly/movies/data/models/movie_details_model.dart';
import 'package:watchly/movies/data/models/movie_model.dart';
import 'package:watchly/movies/data/models/similar_movies_model.dart';
import 'package:watchly/movies/domain/usecases/get_movie_details.dart';
import 'package:watchly/movies/domain/usecases/get_similar_movies.dart';

abstract class BaseRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsPar p);
  Future<List<SimilarMoviesModel>> getSimilarMovies(SimiarMoviePar p);
}

class RemoteDatasource extends BaseRemoteDataSource {
  final Dio _dio = Dio();

  Future<List<MovieModel>> _fetchMovies(String endpoint) async {
    final response = await _dio.get(ApiConstants.movieListPath(endpoint));

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (element) => MovieModel.fromJson(element),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getNowPlayingMovies() =>
      _fetchMovies(ApiConstants.now);

  @override
  Future<List<MovieModel>> getPopularMovies() => _fetchMovies(ApiConstants.pop);

  @override
  Future<List<MovieModel>> getTopRatedMovies() =>
      _fetchMovies(ApiConstants.top);

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsPar p) async {
    final response = await _dio.get(ApiConstants.movieDetailsPath(p.movieId));

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<SimilarMoviesModel>> getSimilarMovies(SimiarMoviePar p) async {
    final response = await _dio.get(ApiConstants.movieSimilarPath(p.movieId));

    if (response.statusCode == 200) {
      return List<SimilarMoviesModel>.from(
        (response.data['results'] as List).map(
          (element) => SimilarMoviesModel.fromJson(element),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
