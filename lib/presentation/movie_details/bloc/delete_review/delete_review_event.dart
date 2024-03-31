import 'package:equatable/equatable.dart';

sealed class DeleteReviewEvent extends Equatable {
  const DeleteReviewEvent();
}

class DeleteReview extends DeleteReviewEvent {
  final String reviewId;

  const DeleteReview({required this.reviewId});

  @override
  List<Object> get props => [reviewId];
}
