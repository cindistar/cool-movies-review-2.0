import 'package:coolmovies/core/util/utils.dart';
import 'package:coolmovies/domain/entities/entities.dart';
import 'package:flutter/material.dart';

class AddReviewForMovieTextWidget extends StatelessWidget {
  const AddReviewForMovieTextWidget({
    super.key,
    required this.movie,
  });

  final MoviesEntity movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: MovieWords.addReviewForMovie,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: movie.title,
                    style: const TextStyle(
                      color: MovieColors.greenApple,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
