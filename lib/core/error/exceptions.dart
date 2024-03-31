import 'package:equatable/equatable.dart';

class CreateReviewException extends Equatable implements Exception {
  final String? message;
  final int statusCode;

  const CreateReviewException({this.message, this.statusCode = 500});

  @override
  List<Object?> get props => [message, statusCode];
}

class AllMoviesListException extends Equatable implements Exception {
  final String? message;
  final int statusCode;

  const AllMoviesListException({this.message, this.statusCode = 500});
  @override
  List<Object?> get props => [message, statusCode];
}

class DeleteReviewException extends Equatable implements Exception {
  final String? message;
  final int statusCode;

  const DeleteReviewException({this.message, this.statusCode = 500});

  @override
  List<Object?> get props => [message, statusCode];
}
