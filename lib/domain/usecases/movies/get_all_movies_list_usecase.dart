import 'package:coolmovies/core/error/failures.dart';
import 'package:coolmovies/core/util/usecase.dart';
import 'package:coolmovies/domain/entities/movies/movies_entity.dart';
import 'package:coolmovies/domain/repositories/movies/movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAllMoviesListUsecase extends Usecase<List<MoviesEntity>, NoParams> {
  final MoviesRepository _moviesRepository;

  GetAllMoviesListUsecase({
    required MoviesRepository moviesRepository,
  }) : _moviesRepository = moviesRepository;

  @override
  Future<Either<Failure, List<MoviesEntity>>> call(
      {required NoParams params}) async {
    try {
      return _moviesRepository.getAllMoviesList();
    } catch (e) {
      throw AllMoviesListFailure(message: e.toString());
    }
  }
}
