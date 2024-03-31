import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  const Failure();

  @override
  List<Object?> get props => [];
}

class CreateReviewFailure extends Failure {
  final String? message;
  const CreateReviewFailure({this.message});
}

class ServerFailure extends Failure {
  final String? message;

  const ServerFailure({this.message});
}

class DeleteReviewFailure extends Failure {
  final String? message;

  const DeleteReviewFailure({this.message});
}

class AllMoviesListFailure extends Failure {
  final String? message;
  const AllMoviesListFailure({this.message});
}
