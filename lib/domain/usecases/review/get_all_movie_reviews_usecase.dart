import 'package:coolmovies/core/util/usecase.dart';
import 'package:coolmovies/domain/entities/review/review_entity.dart';
import 'package:coolmovies/domain/repositories/review/review_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAllMovieReviewsListUsecase
    extends UseCaseStream<List<ReviewEntity>, NoParams> {
  final ReviewRepository _reviewRepository;

  GetAllMovieReviewsListUsecase({
    required ReviewRepository reviewRepository,
  }) : _reviewRepository = reviewRepository;

  @override
  Stream<List<ReviewEntity>> call(NoParams params) {
    return _reviewRepository.getAllReviewsStreamList();
  }
}
