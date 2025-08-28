import 'package:flutter/widgets.dart';
import 'package:watchly/movies/domain/entities/movie_entity.dart';
import 'package:watchly/movies/presentation/widgets/movie_card.dart';

class VerticalMovieCards extends StatelessWidget {
  final List<MovieEntity> movies;
  const VerticalMovieCards({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: movies.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        return MovieCard(movie: movies[index]);
      },
    );
  }
}
