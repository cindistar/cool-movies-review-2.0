import 'dart:convert';
import 'package:coolmovies/domain/entities/entities.dart';

class ReviewModel extends ReviewEntity {
  final String bodyModel;
  final int ratingModel;
  final String titleModel;
  final String movieIdModel;
  final String nodeIdModel;
  final String userReviewerIdModel;
  final String idModel;

  const ReviewModel({
    required this.bodyModel,
    required this.ratingModel,
    required this.titleModel,
    required this.movieIdModel,
    required this.nodeIdModel,
    required this.userReviewerIdModel,
    required this.idModel,
  }) : super(
          body: bodyModel,
          rating: ratingModel,
          title: titleModel,
          movieId: movieIdModel,
          nodeId: nodeIdModel,
          userReviewerId: userReviewerIdModel,
          id: idModel,
        );

  factory ReviewModel.fromEntity({
    required ReviewEntity movieEntity,
  }) {
    return ReviewModel(
      idModel: movieEntity.id,
      titleModel: movieEntity.title,
      bodyModel: movieEntity.body,
      ratingModel: movieEntity.rating,
      movieIdModel: movieEntity.movieId,
      nodeIdModel: movieEntity.nodeId,
      userReviewerIdModel: movieEntity.userReviewerId,
    );
  }

  @override
  List<Object> get props => [
        idModel,
        titleModel,
        bodyModel,
        ratingModel,
        movieIdModel,
        nodeIdModel,
        idModel,
      ];

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'body': bodyModel,
      'rating': ratingModel,
      'title': titleModel,
      'movieId': movieIdModel,
      'nodeId': nodeIdModel,
      'userReviewerId': userReviewerIdModel,
      'id': idModel,
    };
  }

  factory ReviewModel.fromMap(Map<dynamic, dynamic> map) {
    return ReviewModel(
      bodyModel: map['body'] as String,
      ratingModel: map['rating'] as int,
      titleModel: map['title'] as String,
      movieIdModel: map['movieId'] as String,
      nodeIdModel: map['nodeId'] as String,
      userReviewerIdModel: map['userReviewerId'] as String,
      idModel: map['id'] as String,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'ReviewModel(bodyModel: $bodyModel, ratingModel: $ratingModel, titleModel: $titleModel, movieIdModel: $movieIdModel, nodeIdModel: $nodeIdModel, userReviewerIdModel: $userReviewerIdModel, idModel: $idModel)';
  }
}
