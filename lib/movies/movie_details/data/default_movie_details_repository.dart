import 'package:dartz/dartz.dart';
import 'package:movie_mania/core/data/error/failure.dart';
import 'package:movie_mania/movies/movie_details/data/remote_service.dart';
import 'package:movie_mania/movies/movie_details/domain/get_movie_details.dart';
import 'package:movie_mania/movies/movie_details/domain/get_recommendation.dart';
import 'package:movie_mania/movies/movie_details/domain/models/movie_details.dart';
import 'package:movie_mania/movies/movie_details/domain/models/recommendations.dart';
import 'package:movie_mania/movies/movie_details/domain/movie_detail_repository.dart';

import '../../../core/data/error/exceptions.dart';

class DefaultMoviesDetailsRepository extends MovieDetailsRepository {
  final MovieDetailsRemoteDataSorce remoteService;

  DefaultMoviesDetailsRepository(this.remoteService);

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final result = await remoteService.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters) async {
    final result = await remoteService.getRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
