import 'package:coolmovies/core/error/error.dart';
import 'package:coolmovies/data/datasources/review/review_datasource.dart';
import 'package:coolmovies/domain/entities/create_review/create_review_entity.dart';
import 'package:coolmovies/domain/entities/review/review_entity.dart';
import 'package:coolmovies/domain/repositories/repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ReviewRepository)
class ReviewRepositoryImpl extends ReviewRepository {
  final ReviewDatasource _reviewDatasource;

  ReviewRepositoryImpl({required ReviewDatasource reviewDatasource})
      : _reviewDatasource = reviewDatasource;

  @override
  Future<Either<Failure, bool>> createReview(
      {required CreateReviewEntity createReview}) async {
    try {
      final result = await _reviewDatasource.createReview(
          createReviewEntity: createReview);

      if (!result) {
        return const Left(
            CreateReviewFailure(message: 'Review creation failed'));
      }
      return Right(result);
    } on CreateReviewException catch (exception) {
      throw Left(CreateReviewFailure(message: exception.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteReview({required String reviewId}) async {
    try {
      final result = await _reviewDatasource.deleteReview(reviewId: reviewId);
      if (!result) {
        return const Left(
            DeleteReviewFailure(message: 'Review deletion failed'));
      }
      return Right(result);
    } on DeleteReviewException catch (exception) {
      throw Left(DeleteReviewFailure(message: exception.toString()));
    }
  }

  @override
  Stream<List<ReviewEntity>> getAllReviewsStreamList() {
    try {
      return _reviewDatasource.getAllReviewsStreamList();
    } on AllMoviesListException catch (e) {
      throw Left(AllMoviesListFailure(message: e.toString()));
    }
  }
}
