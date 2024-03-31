import 'package:coolmovies/presentation/create_review/bloc/create_review/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('supports value comparison', () {
    expect(const CreateReviewState(), const CreateReviewState());
  });

  test('copy attributes', () {
    final CreateReviewState state = const CreateReviewState().copyWith();
    expect(state, isA<CreateReviewState>());
    expect(state, equals(const CreateReviewState()));
    expect(state.props.isNotEmpty, true);
  });
}
