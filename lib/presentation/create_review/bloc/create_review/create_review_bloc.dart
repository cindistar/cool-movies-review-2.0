import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coolmovies/core/util/status_enum.dart';

import 'package:coolmovies/domain/usecases/review/create_review_usecase.dart';
import 'package:coolmovies/presentation/create_review/bloc/create_review/bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateReviewBloc extends Bloc<CreateReviewEvent, CreateReviewState> {
  final CreateReviewUsecase _createReviewUsecase;
  CreateReviewBloc({
    required CreateReviewUsecase createReviewUsecase,
  })  : _createReviewUsecase = createReviewUsecase,
        super(const CreateReviewState()) {
    on<CreateReview>(_createMovieReview);
  }

  FutureOr<void> _createMovieReview(
      CreateReview event, Emitter<CreateReviewState> emit) async {
    emit(state.copyWith(status: StatusEnum.loading));

    final failureOrSuccess = await _createReviewUsecase.call(
      params: CreateReviewParams(
        createReviewEntity: event.createReviewEntity,
      ),
    );

    failureOrSuccess.fold(
        (failure) => emit(state.copyWith(
              status: StatusEnum.failure,
            )), (isReviewDone) {
      if (isReviewDone) {
        emit(
          state.copyWith(
            status: StatusEnum.success,
            isReviewDone: true,
          ),
        );
      }
    });
  }
}
