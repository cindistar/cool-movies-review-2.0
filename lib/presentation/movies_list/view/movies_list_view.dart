import 'package:coolmovies/core/util/utils.dart';
import 'package:coolmovies/presentation/mixins/snack_bar_mixin.dart';
import 'package:coolmovies/presentation/movies_list/bloc/movies_list/bloc.dart';
import 'package:coolmovies/presentation/movies_list/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesListView extends StatefulWidget {
  const MoviesListView({super.key});

  @override
  State<MoviesListView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesListView> with SnackBarMixin {
  late MoviesListBloc _moviesListBloc;

  @override
  void initState() {
    super.initState();

    _moviesListBloc = BlocProvider.of<MoviesListBloc>(context);
    _moviesListBloc.add(GetMoviesList());
  }

  @override
  void dispose() {
    super.dispose();
    _moviesListBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: const Size(50, 50),
          child: Container(
            color: Colors.black,
            child: const CustomAppBar(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                MovieWords.movies,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<MoviesListBloc, MoviesListState>(
                  bloc: _moviesListBloc,
                  builder: (context, state) {
                    if (state.status == StatusEnum.success) {
                      final movies = state.moviesList;
                      return GridViewCountWidget(movies: movies);
                    }
                    if (state.status == StatusEnum.failure) {
                      showSnackbarWithGenericErrorMessage(
                        context,
                        MovieWords.genericErrorMessage,
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
