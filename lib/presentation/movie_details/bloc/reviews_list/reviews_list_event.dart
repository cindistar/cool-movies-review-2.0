import 'package:equatable/equatable.dart';

sealed class ReviewsListEvent extends Equatable {
  const ReviewsListEvent();
}

class GetReviewsList extends ReviewsListEvent {

  @override
  List<Object> get props => [];
}
