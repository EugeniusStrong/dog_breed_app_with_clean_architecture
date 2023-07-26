import 'package:equatable/equatable.dart';

class DogEntity extends Equatable {
  final SizeEntity? weight;
  final SizeEntity? height;
  final int? id;
  final String? name;
  final String? bredFor;
  final String? breedGroup;
  final String? lifeSpan;
  final String? temperament;
  final String? origin;
  final String? referenceImageId;
  final ImageEntity? image;

  const DogEntity(
      {required this.weight,
      required this.height,
      required this.id,
      required this.name,
      required this.bredFor,
      required this.breedGroup,
      required this.lifeSpan,
      required this.temperament,
      required this.origin,
      required this.referenceImageId,
      required this.image});

  @override
  List<Object?> get props => [
        weight,
        height,
        id,
        name,
        bredFor,
        breedGroup,
        lifeSpan,
        temperament,
        origin,
        referenceImageId,
        image
      ];
}

class SizeEntity {
  final String? imperial;
  final String? metric;

  const SizeEntity({this.imperial, this.metric});
}

class ImageEntity {
  final String? id;
  final int? width;
  final int? height;
  final String? url;

  const ImageEntity({this.id, this.width, this.height, this.url});
}
