import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchly/core/services/services_locator.dart';
import 'package:watchly/movies/presentation/bloc/movies_bloc.dart';
import 'package:watchly/movies/presentation/widgets/vertical_movie_cards.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (_) => sl<MoviesBloc>()..add(GetPopularMoviesEvent()),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Popular Movies"),
            backgroundColor: Color.fromRGBO(25, 25, 25, 1),
          ),
          body: BlocBuilder<MoviesBloc, MoviesState>(
            builder: (context, state) =>
                VerticalMovieCards(movies: state.popularMovies),
          ),
        ),
      ),
    );
  }
}
