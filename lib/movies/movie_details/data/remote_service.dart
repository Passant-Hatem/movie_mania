import 'package:dio/dio.dart';
import 'package:movie_mania/movies/movie_details/data/models/recommendations_response.dart';

import '../../../core/data/error/exceptions.dart';
import '../../../core/data/network/api_constance.dart';
import '../../../core/data/network/error_message_model.dart';
import '../domain/get_movie_details.dart';
import '../domain/get_recommendation.dart';
import 'models/movie_details_response.dart';

abstract class MovieDetailsRemoteDataSorce {
  Future<MovieDetailsResponse> getMovieDetails(
      MovieDetailsParameters parameters);

  Future<List<RecommendationResponse>> getRecommendation(
      RecommendationParameters parameters);
}

class DefaultMovieDetailsRemoteDataSource extends MovieDetailsRemoteDataSorce {
  @override
  Future<MovieDetailsResponse> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.movieDetailsPath(parameters.movieId));

    if (response.statusCode == 200) {
      return MovieDetailsResponse.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationResponse>> getRecommendation(
      RecommendationParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.recommendationPath(parameters.id));

    if (response.statusCode == 200) {
      return List<RecommendationResponse>.from(
          (response.data["results"] as List).map(
        (e) => RecommendationResponse.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
