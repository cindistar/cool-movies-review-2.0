import 'package:coolmovies/presentation/movie_details/bloc/delete_review/bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:coolmovies/core/error/error.dart';
import 'package:coolmovies/core/util/status_enum.dart';
import 'package:coolmovies/domain/entities/entities.dart';
import 'package:coolmovies/domain/usecases/usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/review_mock.dart';

class MockDeleteReviewUsecase extends Mock implements DeleteReviewUsecase {}

void main() {
  late DeleteReviewBloc deleteReviewBloc;
  late MockDeleteReviewUsecase usecase;

  ReviewEntity review = ReviewMock.reviewEntity;
  String reviewId = review.id;

  DeleteReviewParams params = DeleteReviewParams(reviewId: reviewId);

  setUp(() async {
    usecase = MockDeleteReviewUsecase();

    deleteReviewBloc = DeleteReviewBloc(deleteReviewUsecase: usecase);
  });

  blocTest<DeleteReviewBloc, DeleteReviewState>(
    'emits [StatusEnum.success] when DeleteReview is added.',
    setUp: () {
      when(() => usecase(params: params)).thenAnswer(
        (_) async => const Right(true),
      );
    },
    build: () => deleteReviewBloc,
    act: (bloc) => bloc.add(DeleteReview(reviewId: reviewId)),
    expect: () => const <DeleteReviewState>[
      DeleteReviewState(status: StatusEnum.loading),
      DeleteReviewState(status: StatusEnum.success, isReviewDeleted: true)
    ],
  );

  blocTest<DeleteReviewBloc, DeleteReviewState>(
    'emits [StatusEnum.failure] when DeleteReview fails.',
    setUp: () {
      when(() => usecase(params: params)).thenAnswer(
        (_) async => const Left(CreateReviewFailure()),
      );
    },
    build: () => deleteReviewBloc,
    act: (bloc) => bloc.add(DeleteReview(reviewId: reviewId)),
    expect: () => const <DeleteReviewState>[
      DeleteReviewState(status: StatusEnum.loading),
      DeleteReviewState(status: StatusEnum.failure, isReviewDeleted: false)
    ],
  );
}
