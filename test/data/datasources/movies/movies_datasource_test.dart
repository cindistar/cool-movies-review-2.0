import 'package:coolmovies/core/error/error.dart';
import 'package:coolmovies/core/util/utils.dart';
import 'package:coolmovies/data/datasources/datasources.dart';
import 'package:coolmovies/data/models/models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/movies_mock.dart';

class MockGraphQLClient extends Mock implements GraphQLClient {}

void main() {
  late MovieDatasource datasource;
  late MockGraphQLClient client;

  Map<String, dynamic> movies = MoviesMock.moviesJson;

  setUp(() {
    client = MockGraphQLClient();
    datasource = MovieDatasourceImpl(client: client);
  });

  setUpAll(() {
    registerFallbackValue(QueryOptions<Object?>(
        pollInterval: const Duration(seconds: 3),
        fetchPolicy: FetchPolicy.noCache,
        document: gql(
          GraphQLQuerys.allMoviesQuery,
        )));
  });

  group('getAllMoviesList', () {
    test('success - should return a list of movies model', () async {
      // arrange
      var queryResult = QueryResult(
          data: movies,
          source: QueryResultSource.network,
          options: QueryOptions(
              pollInterval: const Duration(seconds: 3),
              fetchPolicy: FetchPolicy.noCache,
              document: gql(
                GraphQLQuerys.allMoviesQuery,
              )));

      when(() => client.query(any())).thenAnswer((_) async => queryResult);

      // act
      final result = await datasource.getAllMoviesList();

      // assert
      expect(result, isA<List<MoviesModel>>());
    });

    test('failure - should throw a all movies list exception', () async {
      // arrange
      var queryResult = QueryResult(
          source: QueryResultSource.network,
          options: QueryOptions(
              pollInterval: const Duration(seconds: 3),
              fetchPolicy: FetchPolicy.noCache,
              document: gql("")));
      when(() => client.query(any())).thenAnswer((_) async => queryResult);

      when(() => client.query(any())).thenThrow(const AllMoviesListException());

      try {
        await datasource.getAllMoviesList();
        fail('Should throw AllMoviesListException');
      } catch (e) {
        // assert
        expect(e, isA<AllMoviesListException>());
      }
    });
  });
}
