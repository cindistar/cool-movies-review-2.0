import 'package:coolmovies/core/error/error.dart';
import 'package:coolmovies/data/datasources/movies/movies_datasource.dart';
import 'package:coolmovies/domain/entities/movies/movies_entity.dart';
import 'package:coolmovies/domain/repositories/repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MoviesRepository)
class MovieRepositoryImpl extends MoviesRepository {
  final MovieDatasource _movieDatasource;

  MovieRepositoryImpl({required MovieDatasource movieDatasource})
      : _movieDatasource = movieDatasource;
  @override
  Future<Either<Failure, List<MoviesEntity>>> getAllMoviesList() async {
    try {
      final moviesList = await _movieDatasource.getAllMoviesList();

      return Right(moviesList);
    } on AllMoviesListException catch (exception) {
      throw Left(AllMoviesListFailure(message: exception.toString()));
    } catch (e) {
      return const Left(AllMoviesListFailure());
    }
  }
}
