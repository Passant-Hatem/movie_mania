import 'package:dio/dio.dart';

import '../../../core/data/error/exceptions.dart';
import '../../../core/data/network/api_constance.dart';
import '../../../core/data/network/error_message_model.dart';
import 'models/movies_response.dart';

abstract class MovieRemoteDataSource {
  Future<List<MoviesResponse>> getNowPlayingMovies();

  Future<List<MoviesResponse>> getPopularMovies();

  Future<List<MoviesResponse>> getTopRatedMovies();
}

class DefaultMovieRemoteDataSource extends MovieRemoteDataSource {
  @override
  Future<List<MoviesResponse>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MoviesResponse>.from((response.data["results"] as List).map(
        (e) => MoviesResponse.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesResponse>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviesPath);

    if (response.statusCode == 200) {
      return List<MoviesResponse>.from((response.data["results"] as List).map(
        (e) => MoviesResponse.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesResponse>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedMoviesPath);

    if (response.statusCode == 200) {
      return List<MoviesResponse>.from((response.data["results"] as List).map(
        (e) => MoviesResponse.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
