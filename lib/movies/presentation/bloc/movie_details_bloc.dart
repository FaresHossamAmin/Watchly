import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchly/core/utils/enums.dart';
import 'package:watchly/movies/domain/entities/movie_details_entity.dart';
import 'package:watchly/movies/domain/entities/similar_movies.dart';
import 'package:watchly/movies/domain/usecases/get_movie_details.dart';
import 'package:watchly/movies/domain/usecases/get_similar_movies.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetSimilarMoviesUseCase getSimilarMoviesUseCase;

  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getSimilarMoviesUseCase)
    : super(MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetSimilarMoviesEvent>(_getSimilarMovies);
  }

  FutureOr<void> _getMovieDetails(
    GetMovieDetailsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final res = await getMovieDetailsUseCase(
      MovieDetailsPar(movieId: event.id),
    );
    res.fold(
      (l) => emit(
        state.copyWith(
          movieDetailsState: RequestState.error,
          movieDetailsmessage: "ERROR: Movie Details",
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieDetailsEntity: r,
          movieDetailsState: RequestState.loaded,
          movieDetailsmessage: "SUCCESS: Movie Details",
        ),
      ),
    );
  }

  FutureOr<void> _getSimilarMovies(
    GetSimilarMoviesEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final res = await getSimilarMoviesUseCase(
      SimiarMoviePar(movieId: event.id),
    );
    res.fold(
      (l) => emit(
        state.copyWith(
          similarMoviesState: RequestState.error,
          similarMoviesMessage: "ERROR: Movie Similar",
        ),
      ),
      (r) => emit(
        state.copyWith(
          similarMoviesEntity: r,
          similarMoviesState: RequestState.loaded,
          similarMoviesMessage: "SUCCESS: Movie Similar",
        ),
      ),
    );
  }
}
