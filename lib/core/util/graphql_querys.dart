class GraphQLQuerys {
  static String allMoviesQuery = """
  query AllMovies {
    allMovies {
    nodes {
      id
      imgUrl
      title
      releaseDate
      nodeId
    }
  }
}
""";

  static String allMovieReviews = """
   query AllMovieReviews {
  allMovieReviews {
    nodes {
      body
      rating
      title
      movieId
      nodeId
      userReviewerId
      id
    }
  }
}
""";
}
