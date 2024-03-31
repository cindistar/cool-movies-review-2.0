import 'dart:async';

import 'package:coolmovies/core/util/usecase.dart';
import 'package:coolmovies/core/util/status_enum.dart';
import 'package:coolmovies/domain/usecases/movies/get_all_movies_list_usecase.dart';
import 'package:coolmovies/presentation/movies_list/bloc/movies_list/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class MoviesListBloc extends Bloc<MoviesListEvent, MoviesListState> {
  final GetAllMoviesListUsecase _getAllMoviesListUsecase;

  MoviesListBloc({required GetAllMoviesListUsecase getAllMoviesListUsecase})
      : _getAllMoviesListUsecase = getAllMoviesListUsecase,
        super(const MoviesListState()) {
    on<GetMoviesList>(_getMoviesList);
  }

  FutureOr<void> _getMoviesList(
      GetMoviesList event, Emitter<MoviesListState> emit) async {
    emit(state.copyWith(status: StatusEnum.loading));

    final failureOrSuccess =
        await _getAllMoviesListUsecase(params: const NoParams());

    failureOrSuccess.fold(
      (failure) => emit(state.copyWith(status: StatusEnum.failure)),
      (movies) => emit(
        state.copyWith(
          status: StatusEnum.success,
          moviesList: movies,
        ),
      ),
    );
  }
}
