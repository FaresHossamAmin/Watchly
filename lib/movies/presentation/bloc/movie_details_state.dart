part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movieDetailsEntity,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsmessage = "",

    this.similarMoviesEntity = const [],
    this.similarMoviesState = RequestState.loading,
    this.similarMoviesMessage = "",
  });

  final MovieDetailsEntity? movieDetailsEntity;
  final RequestState movieDetailsState;
  final String movieDetailsmessage;

  final List<SimilarMoviesEntity> similarMoviesEntity;
  final RequestState similarMoviesState;
  final String similarMoviesMessage;

  MovieDetailsState copyWith({
    MovieDetailsEntity? movieDetailsEntity,
    RequestState? movieDetailsState,
    String? movieDetailsmessage,
    List<SimilarMoviesEntity>? similarMoviesEntity,
    RequestState? similarMoviesState,
    String? similarMoviesMessage,
  }) {
    return MovieDetailsState(
      movieDetailsEntity: movieDetailsEntity ?? this.movieDetailsEntity,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsmessage: movieDetailsmessage ?? this.movieDetailsmessage,
      similarMoviesEntity: similarMoviesEntity ?? this.similarMoviesEntity,
      similarMoviesState: similarMoviesState ?? this.similarMoviesState,
      similarMoviesMessage: similarMoviesMessage ?? this.similarMoviesMessage,
    );
  }

  @override
  List<Object?> get props => [
    movieDetailsEntity,
    movieDetailsState,
    movieDetailsmessage,
    similarMoviesEntity,
    similarMoviesState,
    similarMoviesMessage,
  ];
}
