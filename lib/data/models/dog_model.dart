import 'package:dog_breed_app_with_clean_architecture/data/models/size_model.dart';

import '../../domain/entities/dog_entity.dart';
import 'image_model.dart';

class DogModel extends DogEntity {
  const DogModel(
      {required super.weight,
      required super.height,
      required super.id,
      required super.name,
      required super.bredFor,
      required super.breedGroup,
      required super.lifeSpan,
      required super.temperament,
      required super.origin,
      required super.referenceImageId,
      required super.image});

  factory DogModel.fromJson(Map<String, dynamic> json) {
    return DogModel(
      weight:
          json['weight'] != null ? SizeModel.fromJson(json['weight']) : null,
      height:
          json['height'] != null ? SizeModel.fromJson(json['height']) : null,
      id: json['id'],
      name: json['name'],
      bredFor: json['bred_for'],
      breedGroup: json['breed_group'],
      lifeSpan: json['life_span'],
      temperament: json['temperament'],
      origin: json['origin'],
      referenceImageId: json['reference_image_id'],
      image: json['image'] != null ? ImageModel.fromJson(json['image']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'weight': weight,
      'height': height,
      'id': id,
      'name': name,
      'bred_for': bredFor,
      'breed_group': breedGroup,
      'life_span': lifeSpan,
      'temperament': temperament,
      'origin': origin,
      'reference_image_id': referenceImageId,
      'image': image
    };
  }

  @override
  String toString() {
    return 'DogModel(id: $id, name: $name, bredFor: $bredFor, breedGroup: $breedGroup, lifeSpan: $lifeSpan, temperament: $temperament, origin: $origin, referenceImageId: $referenceImageId)';
  }
}
