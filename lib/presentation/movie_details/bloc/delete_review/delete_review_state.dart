import 'package:equatable/equatable.dart';
import 'package:coolmovies/core/util/status_enum.dart';

class DeleteReviewState extends Equatable {
  final bool isReviewDeleted;
  final StatusEnum status;
  const DeleteReviewState({
    this.isReviewDeleted = false,
    this.status = StatusEnum.initial,
  });

  @override
  List<Object> get props => [isReviewDeleted, status];

  DeleteReviewState copyWith({
    bool? isReviewDeleted,
    StatusEnum? status,
  }) {
    return DeleteReviewState(
      isReviewDeleted: isReviewDeleted ?? this.isReviewDeleted,
      status: status ?? this.status,
    );
  }
}
