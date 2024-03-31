import 'package:coolmovies/core/error/error.dart';
import 'package:coolmovies/data/datasources/datasources.dart';
import 'package:coolmovies/data/models/models.dart';
import 'package:coolmovies/data/repositories/repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/movies_mock.dart';

class MockMovieDatasource extends Mock implements MovieDatasource {}

void main() {
  late MovieRepositoryImpl repository;
  late MovieDatasource datasource;

  MoviesModel movie = MoviesMock.moviesModel;
  List<MoviesModel> moviesList = [movie];

  setUp(() {
    datasource = MockMovieDatasource();
    repository = MovieRepositoryImpl(movieDatasource: datasource);
  });

  group('getAllMoviesList', () {
    test('success - should return all the movies list', () async {
      // arrange
      when(() => datasource.getAllMoviesList())
          .thenAnswer((_) async => Future.value(moviesList));

      // act
      final result = await repository.getAllMoviesList();

      // assert
      expect(result, isA<Right>());
      verify(() => datasource.getAllMoviesList()).called(1);
    });

    test('failure - should return all movies failure', () async {
      // arrange
      when(() => datasource.getAllMoviesList())
          .thenThrow(const Left(AllMoviesListFailure()));

      // act
      final result = await repository.getAllMoviesList();

      //assert
      expect(
        result,
        const Left(AllMoviesListFailure()),
      );
    });
  });
}
