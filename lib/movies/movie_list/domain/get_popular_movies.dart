import 'package:dartz/dartz.dart';

import 'package:movie_mania/movies/movie_list/domain/movie_repository.dart';
import '../../../core/data/error/failure.dart';
import '../../../core/domain/base_usecases.dart';
import 'models/movie.dart';

class GetPopularMovies extends BaseUseCase<List<Movie>> {
  final MoviesRepository repository;

  GetPopularMovies(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await repository.getPopularMovies();
  }
}
