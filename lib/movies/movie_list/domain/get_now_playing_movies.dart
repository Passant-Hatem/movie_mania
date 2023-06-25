import 'package:dartz/dartz.dart';

import '../../../core/data/error/failure.dart';
import '../../../core/domain/base_usecases.dart';
import 'models/movie.dart';
import 'movie_repository.dart';

class GetNowPlayingMovies extends BaseUseCase<List<Movie>> {
  final MoviesRepository repository;

  GetNowPlayingMovies(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await repository.getNowPlayingMovies();
  }
}
