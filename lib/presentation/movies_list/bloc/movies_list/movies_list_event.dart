import 'package:equatable/equatable.dart';

sealed class MoviesListEvent extends Equatable {
  const MoviesListEvent();
}

class GetMoviesList extends MoviesListEvent {
  @override
  List<Object> get props => [];
}
