import 'package:coolmovies/presentation/movie_details/bloc/reviews_list/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('verify GetReviewsList is ReviewsListEvent', () {
    expect(GetReviewsList(), isA<ReviewsListEvent>());
  });

  test('verify GetReviewsList is equal to Equatable props', () {
    GetReviewsList instance = GetReviewsList();
    expect(instance.props.isEmpty, true);
  });
}
