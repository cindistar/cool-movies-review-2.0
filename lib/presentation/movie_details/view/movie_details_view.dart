import 'package:coolmovies/core/util/utils.dart';
import 'package:coolmovies/domain/entities/entities.dart';
import 'package:coolmovies/presentation/mixins/snack_bar_mixin.dart';
import 'package:coolmovies/presentation/movie_details/bloc/delete_review/bloc.dart';
import 'package:coolmovies/presentation/movie_details/bloc/reviews_list/bloc.dart';
import 'package:coolmovies/presentation/movie_details/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesDetailsView extends StatefulWidget {
  final MoviesEntity moviesEntity;
  const MoviesDetailsView({super.key, required this.moviesEntity});

  @override
  State<MoviesDetailsView> createState() => _MoviesDetailsViewState();
}

class _MoviesDetailsViewState extends State<MoviesDetailsView>
    with SnackBarMixin {
  late ReviewsListBloc _reviewsListBloc;
  late DeleteReviewBloc _deleteReviewBloc;
  late MoviesEntity movie;
  ReviewEntity? review;

  @override
  void initState() {
    super.initState();
    _reviewsListBloc = BlocProvider.of<ReviewsListBloc>(context);

    _deleteReviewBloc = BlocProvider.of<DeleteReviewBloc>(context);

    _reviewsListBloc.add(GetReviewsList());

    movie = widget.moviesEntity;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteReviewBloc, DeleteReviewState>(
      bloc: _deleteReviewBloc,
      listener: (context, state) {
        if (state.status == StatusEnum.success) {
          //_reviewsListBloc.add(GetReviewsList());
          showSnackbarCreateReviewSuccess(
            context,
            MovieWords.reviewDeletedSuccess,
          );
        }
        if (state.status == StatusEnum.failure) {
          showSnackbarWithGenericErrorMessage(
            context,
            MovieWords.genericErrorMessage,
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Text(
            overflow: TextOverflow.ellipsis,
            movie.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: CustomScrollView(
            slivers: [
              SliverListImageButtonTextsWidget(
                title: movie.title,
                image: movie.imgUrl,
                releaseDate: movie.releaseDate,
                movie: movie,
                review: review,
              ),
              BlocBuilder<ReviewsListBloc, ReviewsListState>(
                bloc: _reviewsListBloc,
                builder: (context, state) {
                  if (state.status == StatusEnum.loading) {
                    return const SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: MovieColors.greenApple,
                        ),
                      ),
                    );
                  }
                  if (state.status == StatusEnum.success) {
                    final reviews = state.reviewsList;

                    final filteredReviews = reviews
                        ?.where((review) =>
                            review.movieId == widget.moviesEntity.id)
                        .toList();

                    return Visibility(
                      visible: filteredReviews!.isNotEmpty,
                      replacement: const NoReviewsYetWidget(),
                      child: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: filteredReviews.length,
                          (context, index) {
                            ReviewEntity? reviewDetails =
                                filteredReviews[index];
                            review = reviewDetails;
                            return Dismissible(
                              key: Key(reviewDetails.movieId),
                              direction: DismissDirection.endToStart,
                              background: Container(
                                margin: const EdgeInsets.only(
                                    right: 16, bottom: 25, top: 10),
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                    color: MovieColors.redMaple,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Padding(
                                  padding: EdgeInsets.only(right: 16),
                                  child: Icon(Icons.delete),
                                ),
                              ),
                              onDismissed: (direction) {
                                _deleteReviewBloc.add(
                                    DeleteReview(reviewId: reviewDetails.id));
                              },
                              child: TitleRatingReviewBodyWidget(
                                  review: reviewDetails),
                            );
                          },
                        ),
                      ),
                    );
                  }

                  if (state.status == StatusEnum.failure) {
                    showSnackbarWithGenericErrorMessage(
                      context,
                      MovieWords.genericErrorMessage,
                    );
                  }
                  return const SliverToBoxAdapter();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
