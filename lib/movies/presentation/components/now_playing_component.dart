import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchly/core/utils/enums.dart';
import 'package:watchly/movies/presentation/bloc/movies_bloc.dart';
import 'package:watchly/movies/presentation/components/carousel_movie_list.dart';

class NowPlayingComponent extends StatelessWidget {
  const NowPlayingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.nowPlayingState != current.nowPlayingState,
      builder: (context, state) {
        switch (state.nowPlayingState) {
          case RequestState.loading:
            return SizedBox(
              height: 550,
              child: Center(child: CircularProgressIndicator()),
            );

          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: CarouselMovieList(movies: state.nowPlayingMovies),
            );

          case RequestState.error:
            return SizedBox(
              height: 550,
              child: Center(child: Text(state.nowPlayingMessage)),
            );
        }
      },
    );
  }
}
