import 'package:coolmovies/core/error/error.dart';
import 'package:coolmovies/domain/entities/entities.dart';
import 'package:dartz/dartz.dart';

abstract class ReviewRepository {
  Future<Either<Failure, bool>> createReview({
    required CreateReviewEntity createReview,
  });

  Stream<List<ReviewEntity>> getAllReviewsStreamList();

  Future<Either<Failure, bool>> deleteReview({required String reviewId});
}
