import 'package:flutter/material.dart';
import 'package:watchly/movies/presentation/screens/main_movie_screen.dart';

import 'core/services/services_locator.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies Screen',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromRGBO(25, 25, 25, 1),
      ),
      home: MainMoviesScreen(),
    );
  }
}
