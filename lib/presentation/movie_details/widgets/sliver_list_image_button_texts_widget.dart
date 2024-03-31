import 'package:coolmovies/core/util/utils.dart';
import 'package:coolmovies/domain/entities/entities.dart';
import 'package:coolmovies/presentation/create_review/view/create_review_page.dart';
import 'package:flutter/material.dart';

class SliverListImageButtonTextsWidget extends StatelessWidget {
  final String image;
  final String title;
  final String releaseDate;
  final ReviewEntity? review;
  final MoviesEntity? movie;

  const SliverListImageButtonTextsWidget({
    super.key,
    required this.image,
    required this.title,
    required this.releaseDate,
    required this.review,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Text(
            MovieWords.movieReviewsDetails,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                width: 300,
                height: 400,
                child: Image.network(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            "${MovieWords.releaseDate} $releaseDate",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    MovieWords.reviews,
                    style: const TextStyle(
                      color: MovieColors.lilacGarden,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MovieColors.greenApple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) {
                          return CreateReviewPage(
                            reviewEntity: review,
                            moviesEntity: movie,
                          );
                        }),
                      );
                    },
                    child: Text(
                      MovieWords.addReview,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
