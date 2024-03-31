import 'package:coolmovies/core/error/error.dart';
import 'package:coolmovies/core/util/utils.dart';
import 'package:coolmovies/data/datasources/datasources.dart';
import 'package:coolmovies/data/models/models.dart';

import 'package:coolmovies/domain/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/create_review_mock.dart';
import '../../../mocks/review_mock.dart';

class MockGraphQLClient extends Mock implements GraphQLClient {}

void main() {
  late ReviewDatasource datasource;
  late MockGraphQLClient client;

  CreateReviewEntity createReviewEntity = CreateReviewMock.createReviewEntity;
  Map<String, dynamic> createReview = CreateReviewMock.toMap();
  ReviewEntity review = ReviewMock.reviewEntity;
  String reviewId = review.id;

  setUp(() {
    client = MockGraphQLClient();
    datasource = ReviewDatasourceImpl(client: client);
  });

  setUpAll(() {
    registerFallbackValue(MutationOptions<Object?>(
        document: gql(GraphQLMutations.createReviewMutation),
        variables: createReview,
        fetchPolicy: FetchPolicy.noCache));

    registerFallbackValue(QueryOptions<Object?>(
        pollInterval: const Duration(seconds: 3),
        fetchPolicy: FetchPolicy.noCache,
        document: gql(
          GraphQLQuerys.allMovieReviews,
        )));
  });

  group('createReview', () {
    test(
        'success - should return true when create review mutation is successful',
        () async {
      // arrange
      var queryResult = QueryResult(
          data: createReview,
          source: QueryResultSource.network,
          options: MutationOptions(
            document: gql(
              GraphQLMutations.createReviewMutation,
            ),
            variables: createReview,
            fetchPolicy: FetchPolicy.noCache,
          ));

      when(() => client.mutate(any())).thenAnswer((_) async => queryResult);

      // act
      final result = await datasource.createReview(
        createReviewEntity: createReviewEntity,
      );

      // assert
      expect(result, true);
      verify(() => client.mutate(any())).called(1);
    });

    test(
        'failure - should throw create review exception when create mutation review fails',
        () async {
      // arrange
      when(() => client.mutate(any())).thenThrow(const CreateReviewException());

      // act
      try {
        await datasource.createReview(
          createReviewEntity: createReviewEntity,
        );
        fail('Should throw CreateReviewException');
      } catch (e) {
        // assert
        expect(e, isA<CreateReviewException>());
      }
    });
  });

  group('deleteReview', () {
    test('success - should return true when delete review is successful',
        () async {
      // arrange
      var queryResult = QueryResult(
          source: QueryResultSource.network,
          options: MutationOptions(
            document: gql(
              GraphQLMutations.deleteReviewMutation,
            ),
            variables: {"id": reviewId},
          ));

      when(() => client.mutate(any())).thenAnswer((_) async => queryResult);

      // act
      final result = await datasource.deleteReview(reviewId: reviewId);

      // assert
      expect(result, true);
    });

    test(
        'failure - should return a delete review exception when delete review mutation fails',
        () async {
      // arrange
      when(() => client.mutate(any())).thenThrow(const DeleteReviewException());

      // act
      try {
        await datasource.deleteReview(
          reviewId: reviewId,
        );
        fail('Should throw DeleteReviewException');
      } catch (e) {
        // assert
        expect(e, isA<DeleteReviewException>());
      }
    });
  });

  group('getAllReviewsStreamList', () {
    test('should emit list of reviews when stream is listened to', () async {
      // arrange
      var queryResult = QueryResult(
          source: QueryResultSource.network,
          options: QueryOptions(
              pollInterval: const Duration(seconds: 3),
              fetchPolicy: FetchPolicy.noCache,
              document: gql(
                GraphQLQuerys.allMovieReviews,
              )));

      when(() => client.query(any())).thenAnswer((_) async => queryResult);

      // act
      final stream = datasource.getAllReviewsStreamList();

      // assert
      expect(stream, isA<Stream<List<ReviewModel>>>());
    });

    test('should add error to stream when fetching reviews fails', () async {
      // Arrange
      var queryResult = QueryResult(
          source: QueryResultSource.optimisticResult,
          options: QueryOptions(
              fetchPolicy: FetchPolicy.noCache,
              document: gql(
                "",
              )));

      when(() => client.query(any())).thenAnswer((_) async => queryResult);

      when(() => client.query(any())).thenThrow(const AllMoviesListException());

      // act and assert
      datasource.getAllReviewsStreamList().listen((event) {}, onError: (e) {
        expectLater(e, emitsError(isA<AllMoviesListException>()));
      });
    });
  });
}
