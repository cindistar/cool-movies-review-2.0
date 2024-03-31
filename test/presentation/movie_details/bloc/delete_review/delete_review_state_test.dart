import 'package:coolmovies/presentation/movie_details/bloc/delete_review/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('supports value comparison', () {
    expect(const DeleteReviewState(), const DeleteReviewState());
  });

  test('copy attributes', () {
    final DeleteReviewState state = const DeleteReviewState().copyWith();
    expect(state, isA<DeleteReviewState>());
    expect(state, equals(const DeleteReviewState()));
    expect(state.props.isNotEmpty, true);
  });
}
