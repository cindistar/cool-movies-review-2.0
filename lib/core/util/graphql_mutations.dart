class GraphQLMutations {
  static const String createReviewMutation = """
  mutation createReview(\$id: UUID!, \$title: String!, \$body: String!,  \$rating: Int!, \$userReviewerId: UUID!, \$movieId: UUID!) {
    createMovieReview(
      input: {
        movieReview: {
          id: \$id,
          title: \$title,
          body: \$body,
          rating: \$rating,
          movieId: \$movieId,
          userReviewerId: \$userReviewerId
        }
      }
    ) {
      clientMutationId
    }
  }
""";

  static const String deleteReviewMutation = """
  mutation deleteReview(\$id: UUID!) {
  deleteMovieReviewById(input: { id: \$id }) {
    deletedMovieReviewId
  }
}
""";
}
