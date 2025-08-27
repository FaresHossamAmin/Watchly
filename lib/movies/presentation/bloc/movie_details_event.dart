part of 'movie_details_bloc.dart';

sealed class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id;

  const GetMovieDetailsEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class GetSimilarMoviesEvent extends MovieDetailsEvent {
  final int id;

  const GetSimilarMoviesEvent({required this.id});

  @override
  List<Object> get props => [];
}
