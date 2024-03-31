import 'package:bloc_test/bloc_test.dart';
import 'package:coolmovies/core/error/error.dart';
import 'package:coolmovies/core/util/status_enum.dart';
import 'package:coolmovies/domain/entities/entities.dart';
import 'package:coolmovies/domain/usecases/usecases.dart';
import 'package:coolmovies/presentation/create_review/bloc/create_review/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/create_review_mock.dart';

class MockCreateReviewUsecase extends Mock implements CreateReviewUsecase {}

void main() {
  late CreateReviewBloc createReviewBloc;
  late MockCreateReviewUsecase usecase;

  CreateReviewEntity createReviewEntity = CreateReviewMock.createReviewEntity;

  CreateReviewParams params =
      CreateReviewParams(createReviewEntity: createReviewEntity);

  setUp(() async {
    usecase = MockCreateReviewUsecase();

    createReviewBloc = CreateReviewBloc(createReviewUsecase: usecase);
  });

  blocTest<CreateReviewBloc, CreateReviewState>(
    'emits [StatusEnum.success] when CreateReview is added.',
    setUp: () {
      when(() => usecase(params: params)).thenAnswer(
        (_) async => const Right(true),
      );
    },
    build: () => createReviewBloc,
    act: (bloc) =>
        bloc.add(CreateReview(createReviewEntity: createReviewEntity)),
    expect: () => const <CreateReviewState>[
      CreateReviewState(status: StatusEnum.loading),
      CreateReviewState(status: StatusEnum.success, isReviewDone: true)
    ],
  );

  blocTest<CreateReviewBloc, CreateReviewState>(
    'emits [StatusEnum.failure] when CreateReview fails.',
    setUp: () {
      when(() => usecase(params: params)).thenAnswer(
        (_) async => const Left(CreateReviewFailure()),
      );
    },
    build: () => createReviewBloc,
    act: (bloc) =>
        bloc.add(CreateReview(createReviewEntity: createReviewEntity)),
    expect: () => const <CreateReviewState>[
      CreateReviewState(status: StatusEnum.loading),
      CreateReviewState(status: StatusEnum.failure, isReviewDone: false)
    ],
  );
}
