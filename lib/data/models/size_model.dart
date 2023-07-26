import '../../domain/entities/dog_entity.dart';

class SizeModel extends SizeEntity {
  SizeModel({String? imperial, String? metric})
      : super(imperial: imperial, metric: metric);

  factory SizeModel.fromJson(Map<String, dynamic> json) {
    return SizeModel(imperial: json['imperial'], metric: json['metric']);
  }

  Map<String, dynamic> toJson() {
    return {
      'imperial': imperial,
      'metric': metric,
    };
  }

  @override
  String toString() {
    return 'SizeModel(imperial: $imperial, metric: $metric)';
  }
}
