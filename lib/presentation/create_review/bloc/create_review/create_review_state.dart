import 'package:equatable/equatable.dart';
import 'package:coolmovies/core/util/status_enum.dart';

class CreateReviewState extends Equatable {
  final bool isReviewDone;
  final StatusEnum status;

  const CreateReviewState({
    this.isReviewDone = false,
    this.status = StatusEnum.initial,
  });

  @override
  List<Object?> get props => [isReviewDone, status];

  CreateReviewState copyWith({
    bool? isReviewDone,
    StatusEnum? status,
  }) {
    return CreateReviewState(
      isReviewDone: isReviewDone ?? this.isReviewDone,
      status: status ?? this.status,
    );
  }
}
