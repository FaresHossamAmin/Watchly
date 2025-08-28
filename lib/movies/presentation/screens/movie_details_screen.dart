import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:watchly/core/constants/image_api_constants.dart';
import 'package:watchly/core/services/services_locator.dart';
import 'package:watchly/core/utils/enums.dart';
import 'package:watchly/core/utils/extensions.dart';
import 'package:watchly/movies/domain/entities/genre.dart';
import 'package:watchly/movies/presentation/bloc/movie_details_bloc.dart';
import 'package:watchly/movies/presentation/widgets/movie_rating.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MovieDetailsBloc>()
        ..add(GetMovieDetailsEvent(id: id))
        ..add(GetSimilarMoviesEvent(id: id)),
      child: Scaffold(body: const MovieDetailContent()),
    );
  }
}

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
          switch (state.movieDetailsState) {
            case RequestState.loading:
              return const Center(child: CircularProgressIndicator());

            case RequestState.loaded:
              final movie = state.movieDetailsEntity;
              if (movie == null) {
                return const Center(child: Text("Movie details not available"));
              }

              return CustomScrollView(
                key: const Key('movieDetailScrollView'),
                slivers: [
                  SliverAppBar(
                    pinned: false,
                    expandedHeight: 200.0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: FadeIn(
                        duration: const Duration(milliseconds: 500),
                        child: ShaderMask(
                          shaderCallback: (rect) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black,
                                Colors.black,
                                Colors.transparent,
                              ],
                              stops: [0.0, 0.1, 1.0, 1.0],
                            ).createShader(
                              Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                            );
                          },
                          blendMode: BlendMode.dstIn,
                          child: CachedNetworkImage(
                            width: MediaQuery.of(context).size.width,
                            imageUrl: ImageApiConstants.getImage(
                              movie.backdropPath,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: FadeInUp(
                      from: 60,
                      duration: const Duration(milliseconds: 500),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title,
                              style: GoogleFonts.poppins(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(height: 8.0),

                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2.0,
                                    horizontal: 8.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Text(
                                    movie.releaseDate.split('-')[0],
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 24.0),
                                Row(
                                  children: [
                                    MovieRating(rating: movie.voteAverage),

                                    const SizedBox(width: 6.0),
                                    Text(
                                      (movie.voteAverage / 2).toStringAsFixed(
                                        1,
                                      ),
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(width: 4.0),
                                  ],
                                ),
                                16.sbw,
                                Text(
                                  _showDuration(movie.runtime),
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20.0),

                            Text(
                              movie.overview,
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(height: 8.0),

                            Text(
                              'Genres: ${_showGenres(movie.genres)}',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                    sliver: SliverToBoxAdapter(
                      child: FadeInUp(
                        from: 60,
                        duration: const Duration(milliseconds: 500),
                        child: Text(
                          'More like this'.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
                    sliver: _showSimilarMovies(),
                  ),
                ],
              );

            case RequestState.error:
              return Center(
                child: Text(
                  state.movieDetailsmessage,
                  style: const TextStyle(color: Colors.red),
                ),
              );
          }
        },
      ),
    );
  }

  String _showGenres(List<Genre> genres) {
    if (genres.isEmpty) return "";
    return genres.map((g) => g.name).join(", ");
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;
    return hours > 0 ? '${hours}h ${minutes}m' : '${minutes}m';
  }

  Widget _showSimilarMovies() {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        switch (state.similarMoviesState) {
          case RequestState.loading:
            return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );

          case RequestState.loaded:
            final similarMovies = state.similarMoviesEntity;
            if (similarMovies.isEmpty) {
              return const SliverToBoxAdapter(
                child: Center(child: Text("No recommendations available")),
              );
            }
            return SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                final similar = similarMovies[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            MovieDetailScreen(id: similar.id),
                      ),
                    );
                  },
                  child: FadeInUp(
                    from: 60,
                    duration: const Duration(milliseconds: 500),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: ImageApiConstants.getImage(
                              similar.posterPath ?? "",
                            ),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 220.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            height: 220.0,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          similar.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }, childCount: similarMovies.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.6,
                crossAxisCount: 2,
              ),
            );

          case RequestState.error:
            return SliverToBoxAdapter(
              child: Center(
                child: Text(
                  state.similarMoviesMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
        }
      },
    );
  }
}
