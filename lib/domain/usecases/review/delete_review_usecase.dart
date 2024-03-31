import 'package:coolmovies/core/error/failures.dart';
import 'package:coolmovies/core/util/usecase.dart';
import 'package:coolmovies/domain/repositories/repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteReviewUsecase extends Usecase<bool, DeleteReviewParams> {
  final ReviewRepository _reviewRepository;

  DeleteReviewUsecase({
    required ReviewRepository reviewRepository,
  }) : _reviewRepository = reviewRepository;

  @override
  Future<Either<Failure, bool>> call(
      {required DeleteReviewParams params}) async {
    final result =
        await _reviewRepository.deleteReview(reviewId: params.reviewId);
    return Future.value(result);
  }
}

class DeleteReviewParams extends Equatable {
  final String reviewId;

  const DeleteReviewParams({
    required this.reviewId,
  });
  @override
  List<Object?> get props => [reviewId];
}
