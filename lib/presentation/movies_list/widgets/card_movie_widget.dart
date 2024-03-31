import 'package:coolmovies/core/util/utils.dart';
import 'package:coolmovies/domain/entities/movies/movies_entity.dart';
import 'package:flutter/material.dart';

class CardMovieWidget extends StatelessWidget {
  final MoviesEntity? movie;

  const CardMovieWidget({
    super.key,
    this.movie,
  });

  @override
  Widget build(BuildContext context) {
    final cardMovie = movie;
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: double.maxFinite,
              height: 200,
              child: Image.network(
                movie!.imgUrl,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            overflow: TextOverflow.ellipsis,
            cardMovie!.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                    color: MovieColors.greenApple,
                    borderRadius: BorderRadius.circular(5)),
                child: const Text(
                  "Reviews and infos",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
              const Icon(
                Icons.video_camera_back_rounded,
                color: MovieColors.lilacGarden,
                size: 15,
              ),
              const Icon(
                Icons.star,
                color: MovieColors.redMaple,
                size: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
