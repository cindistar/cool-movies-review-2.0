import 'package:coolmovies/presentation/movies_list/bloc/movies_list/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('supports value comparison', () {
    expect(const MoviesListState(), const MoviesListState());
  });

  test('copy attributes', () {
    final MoviesListState state = const MoviesListState().copyWith();
    expect(state, isA<MoviesListState>());
    expect(state, equals(const MoviesListState()));
    expect(state.props.isNotEmpty, true);
  });
}
