import 'package:coolmovies/core/util/utils.dart';
import 'package:coolmovies/domain/entities/entities.dart';
import 'package:coolmovies/presentation/create_review/widgets/widgets.dart';
import 'package:coolmovies/presentation/mixins/snack_bar_mixin.dart';
import 'package:coolmovies/presentation/create_review/bloc/create_review/bloc.dart';
import 'package:coolmovies/presentation/movie_details/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class CreateReviewView extends StatefulWidget {
  final ReviewEntity? reviewEntity;
  final MoviesEntity? moviesEntity;
  const CreateReviewView(
      {super.key, required this.reviewEntity, required this.moviesEntity});

  @override
  State<CreateReviewView> createState() => _CreateReviewViewState();
}

class _CreateReviewViewState extends State<CreateReviewView>
    with SnackBarMixin {
  late MoviesEntity movie;
  late CreateReviewBloc _createReviewBloc;

  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  final _movieIdController = TextEditingController();
  final _ratingController = TextEditingController();
  final _userReviewerIdController = TextEditingController();
  final _nodeIdController = TextEditingController();

  final FocusNode _idFocusNode = FocusNode();
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _bodyFocusNode = FocusNode();
  final FocusNode _ratingFocusNode = FocusNode();
  final FocusNode _movieIdFocusNode = FocusNode();
  final FocusNode _userReviewerIdFocusNode = FocusNode();
  final FocusNode _nodeIdFocusNode = FocusNode();

  var uuid = const Uuid();

  @override
  void initState() {
    super.initState();
    ReviewEntity? review = widget.reviewEntity;
    movie = widget.moviesEntity!;

    _idController.text = uuid.v4();
    _movieIdController.text = movie.id;
    _userReviewerIdController.text =
        review?.userReviewerId ?? "7b4c31df-04b3-452f-a9ee-e9f8836013cc";

    _createReviewBloc = BlocProvider.of<CreateReviewBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    _idController.dispose();
    _titleController.dispose();
    _bodyController.dispose();
    _movieIdController.dispose();
    _ratingController.dispose();
    _userReviewerIdController.dispose();
    _nodeIdController.dispose();
    _idFocusNode.dispose();
    _titleFocusNode.dispose();
    _bodyFocusNode.dispose();
    _ratingFocusNode.dispose();
    _movieIdFocusNode.dispose();
    _userReviewerIdFocusNode.dispose();
    _nodeIdFocusNode.dispose();
    _createReviewBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocListener<CreateReviewBloc, CreateReviewState>(
        bloc: _createReviewBloc,
        listener: (context, state) {
          if (state.status == StatusEnum.loading) {
            const Center(child: CircularProgressIndicator());
          }
          if (state.status == StatusEnum.success) {
            showSnackbarCreateReviewSuccess(
              context,
              MovieWords.createdReviewSuccess,
            );

            Navigator.popUntil(context, (route) => route.isFirst);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => MovieDetailsPage(moviesEntity: movie),
              ),
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
            title: Text(
              MovieWords.createReview,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  AddReviewForMovieTextWidget(movie: movie),
                  TextFormFieldsWidget(
                    idFocusNode: _idFocusNode,
                    titleFocusNode: _titleFocusNode,
                    bodyFocusNode: _bodyFocusNode,
                    ratingFocusNode: _ratingFocusNode,
                    userReviewerIdFocusNode: _userReviewerIdFocusNode,
                    idController: _idController,
                    titleController: _titleController,
                    bodyController: _bodyController,
                    ratingController: _ratingController,
                    userReviewerController: _userReviewerIdController,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MovieColors.greenApple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final id = _idController.text;
                        final title = _titleController.text;
                        final body = _bodyController.text;
                        final rating = _ratingController.text;
                        final moveId = _movieIdController.text;
                        final userReviewer = _userReviewerIdController.text;

                        final newReview = CreateReviewEntity(
                          id: id,
                          title: title,
                          body: body,
                          rating: int.parse(rating),
                          movieId: moveId,
                          userReviewerId: userReviewer,
                        );
                        _createReviewBloc
                            .add(CreateReview(createReviewEntity: newReview));
                      }
                    },
                    child: Text(
                      MovieWords.submitReview,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
