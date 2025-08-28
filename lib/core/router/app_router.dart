import 'package:go_router/go_router.dart';
import 'package:watchly/core/router/routes.dart';
import 'package:watchly/movies/presentation/screens/main_movie_screen.dart';
import 'package:watchly/movies/presentation/screens/popular_screen.dart';
import 'package:watchly/movies/presentation/screens/top_rated_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: Routes.main,
        builder: (context, state) => const MainMoviesScreen(),
      ),
      GoRoute(
        path: Routes.popular,
        name: 'Popular Movies',
        builder: (context, state) => const PopularScreen(),
      ),
      GoRoute(
        path: Routes.toprated,
        name: 'Top Rated Movies',
        builder: (context, state) => const TopRatedScreen(),
      ),
    ],
  );
}
