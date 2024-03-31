import 'package:coolmovies/core/util/status_enum.dart';
import 'package:coolmovies/domain/entities/movies/movies_entity.dart';
import 'package:equatable/equatable.dart';

class MoviesListState extends Equatable {
  final List<MoviesEntity>? moviesList;
  final StatusEnum status;
  const MoviesListState({
    this.moviesList,
    this.status = StatusEnum.initial,
  });

  @override
  List<Object?> get props => [status, moviesList];

  MoviesListState copyWith({
    List<MoviesEntity>? moviesList,
    StatusEnum? status,
  }) {
    return MoviesListState(
      moviesList: moviesList ?? this.moviesList,
      status: status ?? this.status,
    );
  }
}
