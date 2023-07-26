import '../../domain/entities/dog_entity.dart';

class ImageModel extends ImageEntity {
  ImageModel({id, width, height, url})
      : super(id: id, width: width, height: height, url: url);

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      width: json['width'],
      height: json['height'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'width': width,
      'height': height,
      'url': url,
    };
  }

  @override
  String toString() {
    return 'ImageModel(id: $id, width: $width, height: $height, url: $url)';
  }
}
