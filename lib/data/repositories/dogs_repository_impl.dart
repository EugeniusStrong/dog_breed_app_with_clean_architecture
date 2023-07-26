import 'package:dartz/dartz.dart';
import '../../core/error/exception.dart';
import '../../core/error/failure.dart';
import '../../core/platform/network_info.dart';
import '../../domain/entities/dog_entity.dart';
import '../../domain/repositories/dog_repository.dart';
import '../datasources/dog_local.dart';
import '../datasources/dog_remote.dart';

class DogRepositoryImpl implements DogRepository {
  final DogRemoteDataSources dogRemoteDataSources;
  final DogLocalDataSource dogLocalDataSource;
  final NetworkInfo networkInfo;

  DogRepositoryImpl(
      {required this.dogRemoteDataSources,
      required this.dogLocalDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<DogEntity>>> getAllDogs(int page) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteDogs = await dogRemoteDataSources.getAllDogs(page);
        dogLocalDataSource.dogsToCache(remoteDogs);
        return Right(remoteDogs);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      try {
        final localDog = await dogLocalDataSource.getLastDogsFromCache();
        return Right(localDog);
      } on CacheException {
        return left(CacheFailure());
      }
    }
  }
}
