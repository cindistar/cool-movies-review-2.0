import 'package:coolmovies/core/util/utils.dart';
import 'package:coolmovies/presentation/movies_list/view/movies_list_page.dart';
import 'package:coolmovies/presentation/movie_details/view/movie_details_page.dart';
import 'package:coolmovies/presentation/create_review/view/create_review_page.dart';
import 'package:coolmovies/presentation/splash/view/splash_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      routes: {
        Routes.splash: (context) => const SplashPage(),
        Routes.moviesList: (context) => const MoviesListPage(),
        Routes.movieDetails: (context) => const MovieDetailsPage(),
        Routes.reviews: (context) => const CreateReviewPage(),
      },
    );
  }
}
