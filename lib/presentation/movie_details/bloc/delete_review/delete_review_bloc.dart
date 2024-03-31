import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coolmovies/core/util/status_enum.dart';
import 'package:coolmovies/domain/usecases/review/delete_review_usecase.dart';
import 'package:coolmovies/presentation/movie_details/bloc/delete_review/bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteReviewBloc extends Bloc<DeleteReviewEvent, DeleteReviewState> {
  final DeleteReviewUsecase _deleteReviewUsecase;

  DeleteReviewBloc({required DeleteReviewUsecase deleteReviewUsecase})
      : _deleteReviewUsecase = deleteReviewUsecase,
        super(const DeleteReviewState()) {
    on<DeleteReview>(_deleteMovieReview);
  }

  FutureOr<void> _deleteMovieReview(
      DeleteReview event, Emitter<DeleteReviewState> emit) async {
    emit(state.copyWith(status: StatusEnum.loading));

    final failureOrSuccess = await _deleteReviewUsecase(
      params: DeleteReviewParams(reviewId: event.reviewId),
    );

    failureOrSuccess
        .fold((failure) => emit(state.copyWith(status: StatusEnum.failure)),
            (isReviewDeleted) {
      if (isReviewDeleted) {
        emit(
          state.copyWith(
            status: StatusEnum.success,
            isReviewDeleted: true,
          ),
        );
      }
    });
  }
}
