import 'package:coolmovies/domain/entities/entities.dart';
import 'package:coolmovies/presentation/movie_details/view/movie_details_page.dart';
import 'package:coolmovies/presentation/movies_list/widgets/card_movie_widget.dart';
import 'package:flutter/material.dart';

class GridViewCountWidget extends StatelessWidget {
  const GridViewCountWidget({
    super.key,
    required this.movies,
  });

  final List<MoviesEntity>? movies;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 16,
      childAspectRatio: 0.65,
      children: List.generate(
        movies?.length ?? 0,
        (index) {
          final movie = movies?[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => MovieDetailsPage(
                    moviesEntity: movie,
                  ),
                ),
              );
            },
            child: CardMovieWidget(
              movie: movie,
            ),
          );
        },
      ),
    );
  }
}
