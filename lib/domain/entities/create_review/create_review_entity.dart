import 'package:equatable/equatable.dart';

class CreateReviewEntity extends Equatable {
  final String id;
  final String title;
  final String body;
  final int rating;
  final String movieId;
  final String userReviewerId;

  const CreateReviewEntity({
    required this.id,
    required this.title,
    required this.body,
    required this.rating,
    required this.movieId,
    required this.userReviewerId,
  });

  @override
  List<Object> get props {
    return [
      id,
      title,
      body,
      rating,
      movieId,
      userReviewerId,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'body': body,
      'rating': rating,
      'movieId': movieId,
      'userReviewerId': userReviewerId,
    };
  }
}
