import 'package:coolmovies/core/util/status_enum.dart';
import 'package:coolmovies/domain/entities/review/review_entity.dart';
import 'package:equatable/equatable.dart';

class ReviewsListState extends Equatable {
  final List<ReviewEntity>? reviewsList;
  final StatusEnum status;
  const ReviewsListState({
    this.reviewsList,
    this.status = StatusEnum.initial,
  });

  @override
  List<Object?> get props => [status, reviewsList];

  ReviewsListState copyWith({
    List<ReviewEntity>? reviewsList,
    StatusEnum? status,
  }) {
    return ReviewsListState(
      reviewsList: reviewsList ?? this.reviewsList,
      status: status ?? this.status,
    );
  }
}
