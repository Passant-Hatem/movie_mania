import 'package:movie_mania/movies/movie_list/data/remote_service.dart';
import 'package:movie_mania/movies/movie_list/domain/models/movie.dart';
import 'package:movie_mania/core/data/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_mania/movies/movie_list/domain/movie_repository.dart';

import '../../../core/data/error/exceptions.dart';

class DefaultMoviesRepository extends MoviesRepository {
  final MovieRemoteDataSource movieRemoteDataSource;

  DefaultMoviesRepository(this.movieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await movieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await movieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await movieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
