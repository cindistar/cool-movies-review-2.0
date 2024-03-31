import 'package:coolmovies/presentation/movies_list/bloc/movies_list/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('verify GetMoviesList is MoviesListEvent', () {
    expect(GetMoviesList(), isA<MoviesListEvent>());
  });

  test('verify GetMoviesList is equal to Equatable props', () {
    GetMoviesList instance = GetMoviesList();
    expect(instance.props.isEmpty, true);
  });
}
