import 'package:get_it/get_it.dart';
import 'package:watchly/movies/domain/usecases/get_movie_details.dart';
import 'package:watchly/movies/domain/usecases/get_similar_movies.dart';
import 'package:watchly/movies/presentation/bloc/movie_details_bloc.dart';

import '../../movies/data/datasources/remote_datasource.dart';
import '../../movies/data/repositories/movie_repository.dart';
import '../../movies/domain/repositories/base_movie_repository.dart';
import '../../movies/domain/usecases/get_now_playing.dart';
import '../../movies/domain/usecases/get_popular.dart';
import '../../movies/domain/usecases/get_top_rated.dart';
import '../../movies/presentation/bloc/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // BLOC
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));

    // USE CASE
    sl.registerLazySingleton(() => GetNowPlayingUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetSimilarMoviesUseCase(sl()));

    // REPO
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));

    // DS
    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDatasource());
  }
}
