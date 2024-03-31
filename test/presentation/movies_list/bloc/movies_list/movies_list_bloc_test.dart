import 'package:coolmovies/core/error/error.dart';
import 'package:coolmovies/core/util/usecase.dart';
import 'package:coolmovies/domain/entities/entities.dart';
import 'package:coolmovies/presentation/movies_list/bloc/movies_list/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:coolmovies/core/util/status_enum.dart';
import 'package:coolmovies/domain/usecases/usecases.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/movies_mock.dart';

class MockGetAllMoviesListUsecase extends Mock
    implements GetAllMoviesListUsecase {}

void main() {
  late MoviesListBloc moviesListBloc;
  late GetAllMoviesListUsecase usecase;

  MoviesEntity movies = MoviesMock.moviesEntity;

  List<MoviesEntity> moviesList = [movies];

  setUp(() async {
    usecase = MockGetAllMoviesListUsecase();
    moviesListBloc = MoviesListBloc(getAllMoviesListUsecase: usecase);
  });

  blocTest<MoviesListBloc, MoviesListState>(
    'emits [StatusEnum.success] when GetMoviesList is added.',
    setUp: () {
      when(() => usecase(params: const NoParams())).thenAnswer(
        (_) async => Right(moviesList),
      );
    },
    build: () => moviesListBloc,
    act: (bloc) => bloc.add(GetMoviesList()),
    expect: () => <MoviesListState>[
      const MoviesListState(status: StatusEnum.loading),
      MoviesListState(
        status: StatusEnum.success,
        moviesList: moviesList,
      ),
    ],
  );

  blocTest<MoviesListBloc, MoviesListState>(
    'emits [StatusEnum.failure] when GetMoviesList fails.',
    setUp: () {
      when(() => usecase(params: const NoParams())).thenAnswer(
        (_) async => const Left(AllMoviesListFailure()),
      );
    },
    build: () => moviesListBloc,
    act: (bloc) => bloc.add(GetMoviesList()),
    expect: () => <MoviesListState>[
      const MoviesListState(status: StatusEnum.loading),
      const MoviesListState(status: StatusEnum.failure)
    ],
  );
}
