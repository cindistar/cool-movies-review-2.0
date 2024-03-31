import 'package:coolmovies/core/di/di.dart';
import 'package:coolmovies/presentation/movies_list/bloc/movies_list/movies_list_bloc.dart';
import 'package:coolmovies/presentation/movies_list/view/movies_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesListPage extends StatelessWidget {
  const MoviesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoviesListBloc>(
      create: (_) => getIt<MoviesListBloc>(),
      child: const MoviesListView(),
    );
  }
}
