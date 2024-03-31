import 'package:coolmovies/domain/entities/entities.dart';
import 'package:coolmovies/presentation/movie_details/bloc/delete_review/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks/review_mock.dart';

void main() {
  ReviewEntity review = ReviewMock.reviewEntity;
  String reviewId = review.id;

  test('verify DeleteReview is DeleteReviewEvent', () {
    expect(DeleteReview(reviewId: reviewId), isA<DeleteReviewEvent>());
  });

  test('verify DeleteReview is equal to Equatable props', () {
    DeleteReview instance = DeleteReview(reviewId: reviewId);
    expect(instance.props.isNotEmpty, true);
  });
}
