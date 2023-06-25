import 'package:dartz/dartz.dart';

import '../../../core/data/error/failure.dart';
import 'models/movie.dart';

abstract class MoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
}