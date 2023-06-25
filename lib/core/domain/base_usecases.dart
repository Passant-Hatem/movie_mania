import 'package:dartz/dartz.dart';
import '../data/error/failure.dart';


abstract class BaseUseCase<T> {
  Future<Either<Failure, T>> call();
}

abstract class ParameterizedUseCase<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}