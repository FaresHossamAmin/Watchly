import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchly/core/services/services_locator.dart';
import 'package:watchly/movies/presentation/bloc/movies_bloc.dart';
import 'package:watchly/movies/presentation/components/movie_card.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (_) => sl<MoviesBloc>()..add(GetPopularMoviesEvent()),
        child: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            {
              final movies = state.popularMovies;
              return ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: movies.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return MovieCard(movie: movies[index]);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
