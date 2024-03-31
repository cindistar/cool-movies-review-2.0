import 'package:coolmovies/core/error/error.dart';
import 'package:coolmovies/data/datasources/review/review_datasource.dart';
import 'package:coolmovies/data/repositories/repositories.dart';
import 'package:coolmovies/domain/entities/entities.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/create_review_mock.dart';
import '../../../mocks/review_mock.dart';

class MockReviewDatasource extends Mock implements ReviewDatasource {}

void main() {
  late ReviewRepositoryImpl repository;
  late ReviewDatasource mockDatasource;

  CreateReviewEntity createReviewEntity = CreateReviewMock.createReviewEntity;
  CreateReviewEntity createReviewEmpty = CreateReviewMock.empty;
  ReviewEntity review = ReviewMock.reviewEntity;
  String reviewId = review.id;

  setUp(() {
    mockDatasource = MockReviewDatasource();
    repository = ReviewRepositoryImpl(reviewDatasource: mockDatasource);
  });

  group('createReview', () {
    test('success - should return true when creating a review is successful',
        () async {
      // arrange
      when(() => mockDatasource.createReview(
              createReviewEntity: createReviewEntity))
          .thenAnswer((_) async => true);

      // act
      final result =
          await repository.createReview(createReview: createReviewEntity);

      // assert
      expect(result, const Right(true));
      verify(() => mockDatasource.createReview(
          createReviewEntity: createReviewEntity)).called(1);
    });

    test(
        'failure - should return a create review failure when creating a review fails',
        () async {
      // arrange
      when(() => mockDatasource.createReview(
              createReviewEntity: createReviewEntity))
          .thenAnswer((_) async => false);

      when(() => mockDatasource.createReview(
              createReviewEntity: createReviewEmpty))
          .thenThrow(const CreateReviewException(message: "Review creation failed"));

      // act
      final result =
          await repository.createReview(createReview: createReviewEntity);

      // assert
      expect(result, const Left(CreateReviewFailure()));
    });
  });

  group("deleteReview", () {
    test('success - should return true when deleting a review is successful',
        () async {
      // arrange
      when(() => mockDatasource.deleteReview(reviewId: reviewId))
          .thenAnswer((_) async => true);

      // act
      final result = await repository.deleteReview(reviewId: reviewId);

      // assert
      expect(result, const Right(true));
      verify(() => mockDatasource.deleteReview(reviewId: reviewId)).called(1);
    });
    test(
        'failure - should return a delete review failure when deleting a review fails',
        () async {
      // arrange
      when(() => mockDatasource.deleteReview(reviewId: reviewId))
          .thenAnswer((_) async => false);

      when(() => mockDatasource.deleteReview(reviewId: ""))
          .thenThrow(const DeleteReviewException(message: "Review deletion failed"));

      // act
      final result = await repository.deleteReview(reviewId: reviewId);

      // assert
      expect(result, const Left(DeleteReviewFailure()));
    });
  });

  group("getAllReviewsStreamList", () {
    test('success - should return a stream list of reviews', () async* {
      // arrange
      when(() => mockDatasource.getAllReviewsStreamList())
          .thenAnswer((_) async* {
        [review];
      });

      // act
      final result = repository.getAllReviewsStreamList();

      // assert
      expect(result, isA<Stream<List<ReviewEntity>>>());
      verify(() => mockDatasource.getAllReviewsStreamList()).called(1);
    });

    test('failure - should return all movies list failure', () async* {
      // arrange
      when(() => mockDatasource.getAllReviewsStreamList())
          .thenAnswer((_) async* {
        [];
      });
      when(() => mockDatasource.getAllReviewsStreamList()).thenThrow(
          const AllMoviesListException(message: "Review deletion failed"));

      // act
      final result = repository.getAllReviewsStreamList();

      // assert
      expect(result, const Left(AllMoviesListFailure()));
    });
  });
}
