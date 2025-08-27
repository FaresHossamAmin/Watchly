import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchly/core/usecase/base_usecase.dart';
import 'package:watchly/core/utils/enums.dart';
import 'package:watchly/movies/domain/entities/movie_entity.dart';
import 'package:watchly/movies/domain/usecases/get_now_playing.dart';
import 'package:watchly/movies/domain/usecases/get_popular.dart';
import 'package:watchly/movies/domain/usecases/get_top_rated.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingUseCase getNowPlayingUseCase;
  final GetPopularUseCase getPopularUseCase;
  final GetTopRatedUseCase getTopRatedUseCase;
  MoviesBloc(
    this.getNowPlayingUseCase,
    this.getPopularUseCase,
    this.getTopRatedUseCase,
  ) : super(MoviesState()) {
    on<GetNowPlayingMoviesEvent>(nowPlayingHandler);
    on<GetPopularMoviesEvent>(popularHandler);
    on<GetTopRatedMoviesEvent>(topRatedHandler);
  }
  FutureOr<void> nowPlayingHandler(
    GetNowPlayingMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final res = await getNowPlayingUseCase(NoParameters());
    res.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: "ERROR: Now Playing Movies",
        ),
      ),
      (r) => emit(
        state.copyWith(
          nowPlayingMovies: r,
          nowPlayingState: RequestState.loaded,
          nowPlayingMessage: "SUCCESS: Now Playing State",
        ),
      ),
    );
  }

  FutureOr<void> popularHandler(
    GetPopularMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final res = await getPopularUseCase(NoParameters());
    res.fold(
      (l) {
        emit(
          state.copyWith(
            popularState: RequestState.error,
            popularMessage: "ERROR: popular Movies",
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            popularMovies: r,
            popularState: RequestState.loaded,
            popularMessage: "SUCCESS: popular State",
          ),
        );
      },
    );
  }

  FutureOr<void> topRatedHandler(
    GetTopRatedMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final res = await getTopRatedUseCase(NoParameters());
    res.fold(
      (l) {
        emit(
          state.copyWith(
            topRatedState: RequestState.error,
            topRatedMessage: "ERROR: top rated Movies",
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            topRatedMovies: r,
            topRatedState: RequestState.loaded,
            topRatedMessage: "SUCCESS: Now top rated State",
          ),
        );
      },
    );
  }
}
