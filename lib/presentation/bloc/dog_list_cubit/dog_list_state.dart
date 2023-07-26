import 'package:equatable/equatable.dart';

import '../../../domain/entities/dog_entity.dart';

abstract class DogState extends Equatable {
  const DogState();

  @override
  List<Object?> get props => [];
}

class DogEmpty extends DogState {
  @override
  List<Object?> get props => [];
}

class DogsLoading extends DogState {
  final List<DogEntity> oldDogsList;
  final bool isFirstFetch;

  const DogsLoading(this.oldDogsList, {this.isFirstFetch = false});

  @override
  List<Object?> get props => [oldDogsList];
}

class DogsLoaded extends DogState {
  final List<DogEntity> dogsList;

  const DogsLoaded(this.dogsList);

  @override
  List<Object?> get props => [dogsList];
}

class DogError extends DogState {
  final String message;

  const DogError({required this.message});

  @override
  List<Object?> get props => [message];
}
