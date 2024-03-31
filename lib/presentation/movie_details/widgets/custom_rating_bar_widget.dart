import 'package:coolmovies/core/util/constants/movie_colors.dart';
import 'package:flutter/material.dart';

class CustomRatingBarWidget extends StatelessWidget {
  final int rating;

  const CustomRatingBarWidget({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return InkWell(
          child: Icon(
            index < rating ? Icons.star : Icons.star_border,
            color: MovieColors.redMaple,
          ),
        );
      }),
    );
  }
}
