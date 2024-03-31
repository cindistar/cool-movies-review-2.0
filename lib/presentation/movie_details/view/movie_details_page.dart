import 'package:coolmovies/core/di/di.dart';
import 'package:coolmovies/domain/entities/movies/movies_entity.dart';
import 'package:coolmovies/presentation/movie_details/bloc/delete_review/bloc.dart';
import 'package:coolmovies/presentation/movie_details/bloc/reviews_list/bloc.dart';
import 'package:coolmovies/presentation/movie_details/view/movie_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsPage extends StatelessWidget {
  final MoviesEntity? moviesEntity;
  const MovieDetailsPage({
    super.key,
    this.moviesEntity,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ReviewsListBloc>(
          create: (_) => getIt<ReviewsListBloc>(),
        ),
        BlocProvider<DeleteReviewBloc>(
          create: (_) => getIt<DeleteReviewBloc>(),
        ),
      ],
      child: MoviesDetailsView(moviesEntity: moviesEntity!),
    );
  }
}
