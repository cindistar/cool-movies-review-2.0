import 'package:coolmovies/core/di/di.dart';
import 'package:coolmovies/domain/entities/create_review/create_review_entity.dart';
import 'package:coolmovies/domain/entities/movies/movies_entity.dart';
import 'package:coolmovies/domain/entities/review/review_entity.dart';
import 'package:coolmovies/presentation/create_review/bloc/create_review/create_review_bloc.dart';
import 'package:coolmovies/presentation/create_review/view/create_review_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateReviewPage extends StatelessWidget {
  final ReviewEntity? reviewEntity;
  final CreateReviewEntity? createReviewEntity;
  final MoviesEntity? moviesEntity;
  const CreateReviewPage({
    super.key,
    this.createReviewEntity,
    this.moviesEntity,
    this.reviewEntity,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CreateReviewBloc>(
          create: (_) => getIt<CreateReviewBloc>(),
        ),
      ],
      child: CreateReviewView(
        reviewEntity: reviewEntity,
        moviesEntity: moviesEntity,
      ),
    );
  }
}
