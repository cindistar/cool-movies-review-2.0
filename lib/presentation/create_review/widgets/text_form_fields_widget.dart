import 'package:coolmovies/core/util/utils.dart';
import 'package:flutter/material.dart';

class TextFormFieldsWidget extends StatelessWidget {
  final FocusNode? idFocusNode;
  final FocusNode? titleFocusNode;
  final FocusNode? bodyFocusNode;
  final FocusNode? ratingFocusNode;
  final FocusNode? userReviewerIdFocusNode;
  final TextEditingController? idController;
  final TextEditingController? titleController;

  final TextEditingController? bodyController;

  final TextEditingController? ratingController;

  final TextEditingController? userReviewerController;

  const TextFormFieldsWidget({
    super.key,
    required this.idFocusNode,
    required this.titleFocusNode,
    required this.bodyFocusNode,
    required this.ratingFocusNode,
    required this.userReviewerIdFocusNode,
    required this.idController,
    required this.titleController,
    required this.bodyController,
    required this.ratingController,
    required this.userReviewerController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          style: const TextStyle(color: Colors.white),
          cursorColor: MovieColors.lilacGarden,
          focusNode: titleFocusNode,
          maxLength: 150,
          controller: titleController,
          decoration: InputDecoration(
            labelText: MovieWords.title,
            labelStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            counterStyle: const TextStyle(
              color: MovieColors.greenApple,
              fontWeight: FontWeight.bold,
            ),
            errorStyle: const TextStyle(
              color: MovieColors.redMaple,
              fontWeight: FontWeight.bold,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: MovieColors.greenApple,
              ),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: MovieColors.lilacGarden,
              ),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: MovieColors.redMaple,
              ),
            ),
          ),
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return MovieWords.pleaseEnterTitle;
            }
            return null;
          },
        ),
        TextFormField(
          style: const TextStyle(color: Colors.white),
          cursorColor: MovieColors.lilacGarden,
          focusNode: bodyFocusNode,
          maxLength: 500,
          maxLines: 5,
          controller: bodyController,
          decoration: InputDecoration(
            labelText: MovieWords.reviewText,
            labelStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            counterStyle: const TextStyle(
              color: MovieColors.greenApple,
              fontWeight: FontWeight.bold,
            ),
            errorStyle: const TextStyle(
              color: MovieColors.redMaple,
              fontWeight: FontWeight.bold,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: MovieColors.greenApple,
              ),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: MovieColors.lilacGarden,
              ),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: MovieColors.redMaple,
              ),
            ),
          ),
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return MovieWords.pleaseEnterReview;
            }
            return null;
          },
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.white),
          cursorColor: MovieColors.lilacGarden,
          focusNode: ratingFocusNode,
          controller: ratingController,
          decoration: InputDecoration(
            labelText: MovieWords.ratingoneToFive,
            labelStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            errorStyle: const TextStyle(
              color: MovieColors.redMaple,
              fontWeight: FontWeight.bold,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: MovieColors.greenApple,
              ),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: MovieColors.lilacGarden,
              ),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: MovieColors.redMaple,
              ),
            ),
          ),
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return MovieWords.pleaseTypeRating;
            }
            double rating = double.parse(value);
            if (rating % 1 != 0 || rating < 1 || rating > 5) {
              return MovieWords.validatorOnlyNumbersAllowed;
            }
            return null;
          },
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}
