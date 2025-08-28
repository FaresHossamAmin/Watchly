import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchly/core/services/services_locator.dart';
import 'package:watchly/core/utils/extensions.dart';
import 'package:watchly/movies/presentation/bloc/movies_bloc.dart';
import 'package:watchly/movies/presentation/components/now_playing_component.dart';
import 'package:watchly/movies/presentation/components/popular_component.dart';
import 'package:watchly/movies/presentation/components/top_rated_component.dart';
import 'package:watchly/movies/presentation/screens/popular_screen.dart';
import 'package:watchly/movies/presentation/screens/top_rated_screen.dart';
import 'package:watchly/movies/presentation/widgets/category_see_more.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetTopRatedMoviesEvent())
        ..add(GetPopularMoviesEvent()),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            key: const Key('movieScrollView'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NowPlayingComponent(),
                CategorySeeMore(
                  text: "Popular",
                  seeMore: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => PopularScreen(),
                      ),
                    );
                  },
                ),
                const PopularComponent(),
                CategorySeeMore(
                  text: "Top Rated",
                  seeMore: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => TopRatedScreen(),
                      ),
                    );
                  },
                ),
                const TopRatedComponent(),
                50.sbh,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
