// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:coolmovies/core/di/register_module.dart' as _i19;
import 'package:coolmovies/data/datasources/movies/movies_datasource.dart'
    as _i4;
import 'package:coolmovies/data/datasources/review/review_datasource.dart'
    as _i7;
import 'package:coolmovies/data/repositories/movies/movies_repository_impl.dart'
    as _i6;
import 'package:coolmovies/data/repositories/review/review_repository_impl.dart'
    as _i8;
import 'package:coolmovies/domain/repositories/movies/movies_repository.dart'
    as _i14;
import 'package:coolmovies/domain/repositories/repositories.dart' as _i5;
import 'package:coolmovies/domain/repositories/review/review_repository.dart'
    as _i12;
import 'package:coolmovies/domain/usecases/movies/get_all_movies_list_usecase.dart'
    as _i13;
import 'package:coolmovies/domain/usecases/review/create_review_usecase.dart'
    as _i9;
import 'package:coolmovies/domain/usecases/review/delete_review_usecase.dart'
    as _i10;
import 'package:coolmovies/domain/usecases/review/get_all_movie_reviews_usecase.dart'
    as _i11;
import 'package:coolmovies/presentation/movie_details/bloc/delete_review/delete_review_bloc.dart'
    as _i18;
import 'package:coolmovies/presentation/movie_details/bloc/reviews_list/reviews_list_bloc.dart'
    as _i16;
import 'package:coolmovies/presentation/movies_list/bloc/movies_list/movies_list_bloc.dart'
    as _i15;
import 'package:coolmovies/presentation/create_review/bloc/create_review/create_review_bloc.dart'
    as _i17;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql_flutter/graphql_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.GraphQLClient>(() => registerModule.graphqlClient);
    gh.lazySingleton<_i4.MovieDatasource>(
        () => _i4.MovieDatasourceImpl(client: gh<_i3.GraphQLClient>()));
    gh.lazySingleton<_i5.MoviesRepository>(() =>
        _i6.MovieRepositoryImpl(movieDatasource: gh<_i4.MovieDatasource>()));
    gh.lazySingleton<_i7.ReviewDatasource>(
        () => _i7.ReviewDatasourceImpl(client: gh<_i3.GraphQLClient>()));
    gh.lazySingleton<_i5.ReviewRepository>(() =>
        _i8.ReviewRepositoryImpl(reviewDatasource: gh<_i7.ReviewDatasource>()));
    gh.lazySingleton<_i9.CreateReviewUsecase>(() =>
        _i9.CreateReviewUsecase(reviewRepository: gh<_i5.ReviewRepository>()));
    gh.lazySingleton<_i10.DeleteReviewUsecase>(() =>
        _i10.DeleteReviewUsecase(reviewRepository: gh<_i5.ReviewRepository>()));
    gh.lazySingleton<_i11.GetAllMovieReviewsListUsecase>(() =>
        _i11.GetAllMovieReviewsListUsecase(
            reviewRepository: gh<_i12.ReviewRepository>()));
    gh.lazySingleton<_i13.GetAllMoviesListUsecase>(() =>
        _i13.GetAllMoviesListUsecase(
            moviesRepository: gh<_i14.MoviesRepository>()));
    gh.factory<_i15.MoviesListBloc>(() => _i15.MoviesListBloc(
        getAllMoviesListUsecase: gh<_i13.GetAllMoviesListUsecase>()));
    gh.factory<_i16.ReviewsListBloc>(() => _i16.ReviewsListBloc(
        getAllMovieReviewsListUsecase:
            gh<_i11.GetAllMovieReviewsListUsecase>()));
    gh.factory<_i17.CreateReviewBloc>(() => _i17.CreateReviewBloc(
        createReviewUsecase: gh<_i9.CreateReviewUsecase>()));
    gh.factory<_i18.DeleteReviewBloc>(() => _i18.DeleteReviewBloc(
        deleteReviewUsecase: gh<_i10.DeleteReviewUsecase>()));
    return this;
  }
}

class _$RegisterModule extends _i19.RegisterModule {}
