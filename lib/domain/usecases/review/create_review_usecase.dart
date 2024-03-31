import 'package:coolmovies/core/error/failures.dart';
import 'package:coolmovies/core/util/usecase.dart';
import 'package:coolmovies/domain/entities/create_review/create_review_entity.dart';
import 'package:coolmovies/domain/repositories/repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CreateReviewUsecase extends Usecase<bool, CreateReviewParams> {
  final ReviewRepository _reviewRepository;

  CreateReviewUsecase({
    required ReviewRepository reviewRepository,
  }) : _reviewRepository = reviewRepository;

  @override
  Future<Either<Failure, bool>> call(
      {required CreateReviewParams params}) async {
    final result = await _reviewRepository.createReview(
        createReview: params.createReviewEntity);
    return Future.value(result);
  }
}

class CreateReviewParams extends Equatable {
  final CreateReviewEntity createReviewEntity;

  const CreateReviewParams({
    required this.createReviewEntity,
  });
  @override
  List<Object?> get props => [createReviewEntity];
}
