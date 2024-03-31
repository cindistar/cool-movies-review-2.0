import 'package:coolmovies/data/models/models.dart';
import 'package:coolmovies/domain/entities/entities.dart';

class ReviewMock {
  static ReviewModel get reviewModel => const ReviewModel(
        idModel: '5835e35c-c357-4a85-8f8b-03c7ab3c0a83',
        titleModel: 'Titanic',
        ratingModel: 5,
        bodyModel: 'Ipsem Lorem Titanic lurens ipsulerum',
        movieIdModel: '0c65bf7b-b5cb-4286-a9fe-f085b1af16fd',
        nodeIdModel: 'FGTY-JJJJ-LLLL-UUUU',
        userReviewerIdModel: 'c112a51e-5104-4f67-84de-1ffbb752ee95',
      );

  static ReviewEntity get reviewEntity => ReviewEntity(
        id: reviewModel.idModel,
        title: reviewModel.titleModel,
        rating: reviewModel.ratingModel,
        body: reviewModel.bodyModel,
        movieId: reviewModel.movieIdModel,
        nodeId: reviewModel.nodeIdModel,
        userReviewerId: reviewModel.userReviewerIdModel,
      );
}
