import 'package:coolmovies/data/models/models.dart';
import 'package:coolmovies/domain/entities/entities.dart';

class CreateReviewMock {
  static CreateReviewModel get createReviewModel => const CreateReviewModel(
        idModel: 'dc69ac95-e1a1-47ee-86dd-74058471e416',
        titleModel: 'Star Wars',
        ratingModel: 4,
        bodyModel: 'Ipsulerum Star Wars lurens ipsem lorem',
        movieIdModel: 'cda5deaf-e0d4-48e5-905c-6b63b07a5609',
        userReviewerIdModel: 'f20af2bc-61c7-46fc-9599-0c02a8582393',
      );

  static CreateReviewEntity get createReviewEntity => CreateReviewEntity(
        id: createReviewModel.idModel,
        title: createReviewModel.titleModel,
        rating: createReviewModel.ratingModel,
        body: createReviewModel.bodyModel,
        movieId: createReviewModel.movieIdModel,
        userReviewerId: createReviewModel.userReviewerIdModel,
      );

  static CreateReviewEntity get empty => const CreateReviewEntity(
        id: "",
        title: "",
        rating: 0,
        body: "",
        movieId: "",
        userReviewerId: "",
      );

  static toMap() {
    return <String, dynamic>{
      'idModel': createReviewModel.idModel,
      'titleModel': createReviewModel.titleModel,
      'bodyModel': createReviewModel.bodyModel,
      'ratingModel': createReviewModel.ratingModel,
      'movieIdModel': createReviewModel.movieIdModel,
      'userReviewerIdModel': createReviewModel.userReviewerIdModel,
    };
  }
}
