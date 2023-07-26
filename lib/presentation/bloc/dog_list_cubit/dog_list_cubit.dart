import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../../domain/entities/dog_entity.dart';
import '../../../domain/usecase/get_all_dogs.dart';
import 'dog_list_state.dart';

class DogListCubit extends Cubit<DogState> {
  final GetAllDogs getAllDogs;

  DogListCubit({required this.getAllDogs}) : super(DogEmpty());
  int page = 0;

  void loadDog() async {
    if (state is DogsLoading) return;
    final currentState = state;
    var oldDog = <DogEntity>[];
    if (currentState is DogsLoaded) {
      oldDog = currentState.dogsList;
    }
    emit(DogsLoading(oldDog, isFirstFetch: page == 0));
    final failureOrPerson = await getAllDogs(PageDogsParams(page: page));

    failureOrPerson.fold(
        (error) => emit(DogError(message: _mapFailureToMessage(error))), (dog) {
      page++;
      final dogs = (state as DogsLoading).oldDogsList;
      dogs.addAll(dog);
      debugPrint('List length: ${dog.length.toString()}');
      emit(DogsLoaded(dogs));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return ' SERVER_FAILURE_MESSAGE';
      case CacheFailure:
        return 'CACHED_FAILURE_MESSAGE';
      default:
        return 'Unexpected Error';
    }
  }
}
