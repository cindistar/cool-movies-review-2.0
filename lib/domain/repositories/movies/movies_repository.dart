import 'package:coolmovies/core/error/error.dart';
import 'package:coolmovies/domain/entities/movies/movies_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MoviesRepository {
  Future<Either<Failure, List<MoviesEntity>>> getAllMoviesList();
}
