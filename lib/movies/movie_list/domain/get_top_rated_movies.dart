import 'package:dartz/dartz.dart';

import '../../../core/data/error/failure.dart';
import '../../../core/domain/base_usecases.dart';
import 'models/movie.dart';
import 'movie_repository.dart';

class GetTopRatedMovies extends BaseUseCase<List<Movie>> {
  final MoviesRepository repository;

  GetTopRatedMovies(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await repository.getTopRatedMovies();
  }
}
