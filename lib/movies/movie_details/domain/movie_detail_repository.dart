import 'package:dartz/dartz.dart';

import '../../../core/data/error/failure.dart';
import '../domain/get_movie_details.dart';
import '../domain/get_recommendation.dart';
import '../domain/models/movie_details.dart';
import '../domain/models/recommendations.dart';

abstract class MovieDetailsRepository {
  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailsParameters parameters);

  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters);
}
