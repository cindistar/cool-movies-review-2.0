import 'package:coolmovies/domain/usecases/usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:coolmovies/core/util/usecase.dart';
import 'package:coolmovies/domain/entities/review/review_entity.dart';
import 'package:coolmovies/domain/repositories/review/review_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/review_mock.dart';

class MockReviewRepository extends Mock implements ReviewRepository {}

void main() {
  late GetAllMovieReviewsListUsecase usecase;
  late MockReviewRepository mockReviewRepository;

  ReviewEntity review = ReviewMock.reviewEntity;
  List<ReviewEntity> reviewsList = [review];

  setUp(() {
    mockReviewRepository = MockReviewRepository();
    usecase =
        GetAllMovieReviewsListUsecase(reviewRepository: mockReviewRepository);
  });

  test('should get all movies reviews', () {
    // arrange
    when(() => mockReviewRepository.getAllReviewsStreamList())
        .thenAnswer((_) => Stream.value(reviewsList));

    // act
    final result = usecase(const NoParams());

    // assert
    expect(result, isA<Stream<List<ReviewEntity>>>());
  });
}
