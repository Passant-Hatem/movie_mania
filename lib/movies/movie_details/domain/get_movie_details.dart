import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_mania/core/domain/base_usecases.dart';

import '../../../core/data/error/failure.dart';
import 'models/movie_details.dart';
import 'movie_detail_repository.dart';

class GetMovieDetailsUseCase
    extends ParameterizedUseCase<MovieDetail, MovieDetailsParameters> {
  final MovieDetailsRepository repository;

  GetMovieDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, MovieDetail>> call(
      MovieDetailsParameters parameters) async {
    return await repository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
