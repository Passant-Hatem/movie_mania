import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_mania/core/domain/base_usecases.dart';

import '../../../core/data/error/failure.dart';
import 'models/recommendations.dart';
import 'movie_detail_repository.dart';

class GetRecommendationUseCase extends ParameterizedUseCase<
    List<Recommendation>, RecommendationParameters> {
  final MovieDetailsRepository repository;

  GetRecommendationUseCase(this.repository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameters parameters) async {
    return await repository.getRecommendation(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters(this.id);

  @override
  List<Object> get props => [id];
}
