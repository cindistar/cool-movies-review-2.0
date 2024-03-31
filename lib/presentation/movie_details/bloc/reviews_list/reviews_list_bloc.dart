import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coolmovies/core/util/usecase.dart';
import 'package:coolmovies/core/util/status_enum.dart';
import 'package:coolmovies/domain/entities/entities.dart';
import 'package:coolmovies/domain/usecases/review/get_all_movie_reviews_usecase.dart';
import 'package:coolmovies/presentation/movie_details/bloc/reviews_list/bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ReviewsListBloc extends Bloc<ReviewsListEvent, ReviewsListState> {
  final GetAllMovieReviewsListUsecase _getAllMovieReviewsListUsecase;

  ReviewsListBloc(
      {required GetAllMovieReviewsListUsecase getAllMovieReviewsListUsecase})
      : _getAllMovieReviewsListUsecase = getAllMovieReviewsListUsecase,
        super(const ReviewsListState()) {
    on<GetReviewsList>(_getAllMovieReviewsList);
  }

  FutureOr<void> _getAllMovieReviewsList(
      GetReviewsList event, Emitter<ReviewsListState> emit) async {
    emit(state.copyWith(status: StatusEnum.loading));

    await emit.forEach<List<ReviewEntity>>(
        _getAllMovieReviewsListUsecase(const NoParams()),
        onData: (reviews) {
          if (reviews.isEmpty) {
            return state.copyWith(
                status: StatusEnum.empty, reviewsList: reviews);
          }

          return state.copyWith(
              status: StatusEnum.success, reviewsList: reviews);
        },
        onError: (_, __) => state.copyWith(status: StatusEnum.failure));
  }
}
