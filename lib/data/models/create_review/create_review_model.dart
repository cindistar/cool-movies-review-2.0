import 'package:coolmovies/domain/entities/create_review/create_review_entity.dart';

class CreateReviewModel extends CreateReviewEntity {
  final String idModel;
  final String titleModel;
  final String bodyModel;
  final int ratingModel;
  final String movieIdModel;
  final String userReviewerIdModel;

  const CreateReviewModel({
    required this.idModel,
    required this.titleModel,
    required this.bodyModel,
    required this.ratingModel,
    required this.movieIdModel,
    required this.userReviewerIdModel,
  }) : super(
          id: idModel,
          title: titleModel,
          body: bodyModel,
          rating: ratingModel,
          movieId: movieIdModel,
          userReviewerId: userReviewerIdModel,
        );

  CreateReviewModel copyWith({
    String? idModel,
    String? titleModel,
    String? bodyModel,
    int? ratingModel,
    String? movieIdModel,
    String? userReviewerIdModel,
  }) {
    return CreateReviewModel(
      idModel: idModel ?? this.idModel,
      titleModel: titleModel ?? this.titleModel,
      bodyModel: bodyModel ?? this.bodyModel,
      ratingModel: ratingModel ?? this.ratingModel,
      movieIdModel: movieIdModel ?? this.movieIdModel,
      userReviewerIdModel: userReviewerIdModel ?? this.userReviewerIdModel,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idModel': idModel,
      'titleModel': titleModel,
      'bodyModel': bodyModel,
      'ratingModel': ratingModel,
      'movieIdModel': movieIdModel,
      'userReviewerIdModel': userReviewerIdModel,
    };
  }

  factory CreateReviewModel.fromMap(Map<String, dynamic> map) {
    return CreateReviewModel(
      idModel: map['idModel'] as String,
      titleModel: map['titleModel'] as String,
      bodyModel: map['bodyModel'] as String,
      ratingModel: map['ratingModel'] as int,
      movieIdModel: map['movieIdModel'] as String,
      userReviewerIdModel: map['userReviewerIdModel'] as String,
    );
  }

  @override
  String toString() {
    return 'CreateReviewModel(idModel: $idModel, titleModel: $titleModel, bodyModel: $bodyModel, ratingModel: $ratingModel, movieIdModel: $movieIdModel, userReviewerIdModel: $userReviewerIdModel)';
  }
}
