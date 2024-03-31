import 'dart:async';

import 'package:coolmovies/core/error/error.dart';
import 'package:coolmovies/core/util/graphql_mutations.dart';
import 'package:coolmovies/core/util/graphql_querys.dart';
import 'package:coolmovies/data/models/models.dart';
import 'package:coolmovies/domain/entities/create_review/create_review_entity.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class ReviewDatasource {
  Future<bool> createReview({
    required CreateReviewEntity createReviewEntity,
  });

  Future<bool> deleteReview({required String reviewId});

  Stream<List<ReviewModel>> getAllReviewsStreamList();
}

@LazySingleton(as: ReviewDatasource)
class ReviewDatasourceImpl extends ReviewDatasource {
  final GraphQLClient _client;

  final _streamController = StreamController<List<ReviewModel>>.broadcast();

  ReviewDatasourceImpl({
    required GraphQLClient client,
  }) : _client = client;

  @override
  Future<bool> createReview(
      {required CreateReviewEntity createReviewEntity}) async {
    try {
      final variables = createReviewEntity.toMap();

      QueryResult result = await _client.mutate(MutationOptions(
        fetchPolicy: FetchPolicy.noCache,
        document: gql(GraphQLMutations.createReviewMutation),
        variables: variables,
      ));

      if (result.hasException) {
        return false;
      }
      return true;
    } on CreateReviewException catch (exception) {
      throw CreateReviewException(message: exception.toString());
    }
  }

  @override
  Future<bool> deleteReview({required String reviewId}) async {
    try {
      QueryResult result = await _client.mutate(MutationOptions(
          fetchPolicy: FetchPolicy.noCache,
          document: gql(
            GraphQLMutations.deleteReviewMutation,
          ),
          variables: {"id": reviewId}));

      if (result.hasException) {
        return false;
      }
      return true;
    } on DeleteReviewException catch (exception) {
      throw DeleteReviewException(message: exception.toString());
    }
  }

  @override
  Stream<List<ReviewModel>> getAllReviewsStreamList() async* {
    try {
      final result = await _client.query(QueryOptions(
          pollInterval: const Duration(seconds: 3),
          fetchPolicy: FetchPolicy.noCache,
          document: gql(
            GraphQLQuerys.allMovieReviews,
          )));
      if (result.hasException) {
        throw const AllMoviesListException();
      }

      final reviews = result.data!['allMovieReviews']['nodes'];

      final reviewsList = reviews
          .map((review) => ReviewModel.fromMap(review))
          .cast<ReviewModel>()
          .toList();
      yield reviewsList;
    } on AllMoviesListException catch (exception) {
      _streamController.addError(AllMoviesListException(
        message: exception.toString(),
      ));
    }
  }
}
