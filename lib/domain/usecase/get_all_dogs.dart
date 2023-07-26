import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/dog_entity.dart';
import '../repositories/dog_repository.dart';

class GetAllDogs extends UseCase<List<DogEntity>, PageDogsParams> {
  final DogRepository dogRepository;

  GetAllDogs(this.dogRepository);

  @override
  Future<Either<Failure, List<DogEntity>>> call(PageDogsParams params) async {
    return await dogRepository.getAllDogs(params.page);
  }
}

class PageDogsParams extends Equatable {
  final int page;

  const PageDogsParams({required this.page});
  @override
  List<Object?> get props => [page];
}
