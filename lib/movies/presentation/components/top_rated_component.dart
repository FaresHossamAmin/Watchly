import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchly/core/utils/enums.dart';
import 'package:watchly/movies/presentation/bloc/movies_bloc.dart';
import 'package:watchly/movies/presentation/components/horizontal_movie_cards.dart';

class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.topRatedState != current.topRatedState,
      builder: (context, state) {
        switch (state.topRatedState) {
          case RequestState.loading:
            return SizedBox(
              height: 170,
              child: Center(child: CircularProgressIndicator()),
            );
          case RequestState.loaded:
            {
              final movies = state.topRatedMovies;
              return FadeIn(
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  height: 170.0,
                  child: HorizontalMovieCards(movies: movies),
                ),
              );
            }
          case RequestState.error:
            return SizedBox(
              height: 170,
              child: Center(child: Text(state.topRatedMessage)),
            );
        }
      },
    );
  }
}
