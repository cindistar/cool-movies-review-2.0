import 'package:coolmovies/presentation/movie_details/bloc/reviews_list/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('supports value comparison', () {
    expect(const ReviewsListState(), const ReviewsListState());
  });

  test('copy attributes', () {
    final ReviewsListState state = const ReviewsListState().copyWith();
    expect(state, isA<ReviewsListState>());
    expect(state, equals(const ReviewsListState()));
    expect(state.props.isNotEmpty, true);
  });
}
