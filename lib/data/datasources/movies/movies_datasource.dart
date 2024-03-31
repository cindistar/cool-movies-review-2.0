import 'package:coolmovies/core/error/error.dart';
import 'package:coolmovies/core/util/graphql_querys.dart';
import 'package:coolmovies/data/models/models.dart';
import 'package:coolmovies/data/models/movies/movies_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class MovieDatasource {
  Future<List<MoviesModel>> getAllMoviesList();
}

@LazySingleton(as: MovieDatasource)
class MovieDatasourceImpl extends MovieDatasource {
  final GraphQLClient _client;

  MovieDatasourceImpl({required GraphQLClient client}) : _client = client;

  @override
  Future<List<MoviesModel>> getAllMoviesList() async {
    try {
      final result = await _client.query(QueryOptions(
          fetchPolicy: FetchPolicy.noCache,
          pollInterval: const Duration(seconds: 3),
          document: gql(
            GraphQLQuerys.allMoviesQuery,
          )));
      if (result.hasException) {
        throw const AllMoviesListException(message: "error");
      }

      final movies = result.data!['allMovies']['nodes'];
      final list = movies
          .map((movies) => MoviesModel.fromMap(movies))
          .cast<MoviesModel>()
          .toList();
      return list;
    } on AllMoviesListException catch (e) {
      throw AllMoviesListException(message: e.toString());
    }
  }
}
