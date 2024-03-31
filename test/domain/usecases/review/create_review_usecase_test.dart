import 'package:coolmovies/domain/entities/entities.dart';
import 'package:coolmovies/domain/usecases/usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:coolmovies/domain/repositories/review/review_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/create_review_mock.dart';

class MockReviewRepository extends Mock implements ReviewRepository {}

void main() {
  late CreateReviewUsecase usecase;
  late MockReviewRepository mockReviewRepository;

  CreateReviewEntity createReviewEntity = CreateReviewMock.createReviewEntity;

  CreateReviewParams params =
      CreateReviewParams(createReviewEntity: createReviewEntity);

  setUp(() {
    mockReviewRepository = MockReviewRepository();
    usecase = CreateReviewUsecase(reviewRepository: mockReviewRepository);
  });

  test('success - should create a review', () async {
    // arrange
    when(() =>
            mockReviewRepository.createReview(createReview: createReviewEntity))
        .thenAnswer((_) => Future.value(const Right(true)));

    // act
    final result = await usecase(params: params);

    // assert
    expect(result, const Right(true));
  });
}
