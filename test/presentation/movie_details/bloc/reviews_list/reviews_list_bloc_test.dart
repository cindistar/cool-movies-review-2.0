import 'package:coolmovies/core/util/usecase.dart';
import 'package:coolmovies/domain/entities/entities.dart';
import 'package:coolmovies/presentation/movie_details/bloc/reviews_list/bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:coolmovies/core/error/error.dart';
import 'package:coolmovies/core/util/status_enum.dart';
import 'package:coolmovies/domain/usecases/usecases.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/review_mock.dart';

class MockGetAllMovieReviewsListUsecase extends Mock
    implements GetAllMovieReviewsListUsecase {}

void main() {
  late ReviewsListBloc reviewsListBloc;
  late MockGetAllMovieReviewsListUsecase usecase;

  ReviewEntity reviews = ReviewMock.reviewEntity;

  List<ReviewEntity> streamReviewsList = [reviews];

  setUp(() async {
    usecase = MockGetAllMovieReviewsListUsecase();
    reviewsListBloc = ReviewsListBloc(getAllMovieReviewsListUsecase: usecase);
  });

  blocTest<ReviewsListBloc, ReviewsListState>(
    'emits [StatusEnum.success] when GetReviewsList is added.',
    setUp: () {
      when(() => usecase(const NoParams())).thenAnswer(
        (_) async* {
          yield streamReviewsList;
        },
      );
    },
    build: () => reviewsListBloc,
    act: (bloc) => bloc.add(GetReviewsList()),
    expect: () => <ReviewsListState>[
      const ReviewsListState(status: StatusEnum.loading),
      ReviewsListState(
        status: StatusEnum.success,
        reviewsList: streamReviewsList,
      ),
    ],
  );

  blocTest<ReviewsListBloc, ReviewsListState>(
    'emits [StatusEnum.failure] when GetReviewsList fails.',
    setUp: () {
      when(() => usecase(const NoParams())).thenAnswer(
        (_) => Stream.error(const AllMoviesListFailure()),
      );
    },
    build: () => reviewsListBloc,
    act: (bloc) => bloc.add(GetReviewsList()),
    expect: () => <ReviewsListState>[
      const ReviewsListState(status: StatusEnum.loading),
      const ReviewsListState(status: StatusEnum.failure)
    ],
  );
}
