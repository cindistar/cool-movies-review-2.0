import 'dart:convert';
import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable {
  final String body;
  final int rating;
  final String title;
  final String movieId;
  final String nodeId;
  final String userReviewerId;
  final String id;

  const ReviewEntity({
    required this.body,
    required this.rating,
    required this.title,
    required this.movieId,
    required this.nodeId,
    required this.userReviewerId,
    required this.id,
  });

  @override
  List<Object> get props {
    return [
      body,
      rating,
      title,
      movieId,
      nodeId,
      userReviewerId,
      id,
    ];
  }

  ReviewEntity copyWith({
    String? body,
    int? rating,
    String? title,
    String? movieId,
    String? nodeId,
    String? userReviewerId,
    String? id,
  }) {
    return ReviewEntity(
      body: body ?? this.body,
      rating: rating ?? this.rating,
      title: title ?? this.title,
      movieId: movieId ?? this.movieId,
      nodeId: nodeId ?? this.nodeId,
      userReviewerId: userReviewerId ?? this.userReviewerId,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'body': body,
      'rating': rating,
      'title': title,
      'movieId': movieId,
      'nodeId': nodeId,
      'userReviewerId': userReviewerId,
      'id': id,
    };
  }

  factory ReviewEntity.fromMap(Map<String, dynamic> map) {
    return ReviewEntity(
      body: map['body'] as String,
      rating: map['rating'] as int,
      title: map['title'] as String,
      movieId: map['movieId'] as String,
      nodeId: map['nodeId'] as String,
      userReviewerId: map['userReviewerId'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewEntity.fromJson(String source) =>
      ReviewEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
