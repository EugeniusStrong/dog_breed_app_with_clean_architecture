import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/dog_entity.dart';

abstract class DogRepository {
  Future<Either<Failure, List<DogEntity>>> getAllDogs(int page);
}
