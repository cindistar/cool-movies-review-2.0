import 'package:coolmovies/domain/entities/entities.dart';
import 'package:coolmovies/domain/repositories/repositories.dart';
import 'package:coolmovies/domain/usecases/usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:coolmovies/core/util/usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/movies_mock.dart';

class MockMoviesRepository extends Mock implements MoviesRepository {}

void main() {
  late GetAllMoviesListUsecase usecase;
  late MockMoviesRepository mockMovieRepository;

  MoviesEntity movie = MoviesMock.moviesEntity;
  List<MoviesEntity> moviesList = [movie];

  setUp(() {
    mockMovieRepository = MockMoviesRepository();
    usecase = GetAllMoviesListUsecase(moviesRepository: mockMovieRepository);
  });

  test('should get all movies list', () async {
    // arrange
    when(() => mockMovieRepository.getAllMoviesList())
        .thenAnswer((_) async => Future.value(Right(moviesList)));

    // act
    final result = await usecase(params: const NoParams());

    // assert
    expect(result, isA<Right>());
    expect(
      result.fold(id, id),
      isA<List<MoviesEntity>>(),
    );
  });
}
