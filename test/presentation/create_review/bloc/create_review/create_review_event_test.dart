import 'package:coolmovies/domain/entities/entities.dart';
import 'package:coolmovies/presentation/create_review/bloc/create_review/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks/create_review_mock.dart';

void main() {
  CreateReviewEntity createReviewEntity = CreateReviewMock.createReviewEntity;

  test('verify CreateReview is CreateReviewEvent', () {
    expect(CreateReview(createReviewEntity: createReviewEntity),
        isA<CreateReviewEvent>());
  });

  test('verify CreateReview is equal to Equatable props', () {
    CreateReview instance =
        CreateReview(createReviewEntity: createReviewEntity);
    expect(instance.props.isNotEmpty, true);
  });
}
