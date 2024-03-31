import 'package:coolmovies/domain/usecases/usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:coolmovies/domain/entities/review/review_entity.dart';
import 'package:coolmovies/domain/repositories/review/review_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/review_mock.dart';

class MockReviewRepository extends Mock implements ReviewRepository {}

void main() {
  late DeleteReviewUsecase usecase;
  late MockReviewRepository mockReviewRepository;

  ReviewEntity review = ReviewMock.reviewEntity;
  String reviewId = review.id;

  DeleteReviewParams params = DeleteReviewParams(reviewId: reviewId);

  setUp(() {
    mockReviewRepository = MockReviewRepository();
    usecase = DeleteReviewUsecase(reviewRepository: mockReviewRepository);
  });

  test('success - should delete a review', () async {
    // arrange
    when(() => mockReviewRepository.deleteReview(reviewId: reviewId))
        .thenAnswer((_) => Future.value(const Right(true)));

    // act
    final result = await usecase(params: params);

    // assert
    expect(result, const Right(true));
  });
}
