import 'package:eds_test/domain/entities/response/user/adress/geo_entity.dart';

class GeoModel extends GeoEntity {
  GeoModel({
    required super.lat,
    required super.lng,
  });

  factory GeoModel.fromMap(Map<String, dynamic> map) => GeoModel(
        lat: map['lat'] as String,
        lng: map['lng'] as String,
      );
}
