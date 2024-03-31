import 'package:coolmovies/domain/entities/create_review/create_review_entity.dart';
import 'package:equatable/equatable.dart';

sealed class CreateReviewEvent extends Equatable {
  const CreateReviewEvent();
}

class CreateReview extends CreateReviewEvent {
  final CreateReviewEntity createReviewEntity;

  const CreateReview({required this.createReviewEntity});
  @override
  List<Object> get props => [createReviewEntity];
}
