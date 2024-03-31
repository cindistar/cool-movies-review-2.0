import 'package:coolmovies/core/util/utils.dart';
import 'package:coolmovies/domain/entities/entities.dart';
import 'package:coolmovies/presentation/movie_details/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TitleRatingReviewBodyWidget extends StatelessWidget {
  const TitleRatingReviewBodyWidget({
    super.key,
    required this.review,
  });

  final ReviewEntity? review;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: MovieColors.lightGreenApple,
              borderRadius: BorderRadius.circular(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${MovieWords.title}: ",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      review!.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    "${MovieWords.rating}: ",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  CustomRatingBarWidget(
                    rating: review!.rating,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                "${MovieWords.review}: ${review!.body}",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.arrow_back,
                    size: 8,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    MovieWords.swipeLeftDeleteReview,
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
