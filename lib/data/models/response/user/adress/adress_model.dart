import 'package:eds_test/data/models/response/user/adress/geo_model.dart';
import 'package:eds_test/domain/entities/response/user/adress/adress_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    required super.street,
    required super.suite,
    required super.city,
    required super.zipcode,
    required super.geo,
  });

  factory AddressModel.fromMap(Map<String, dynamic> map) => AddressModel(
        street: map['street'] as String,
        suite: map['suite'] as String,
        city: map['city'] as String,
        zipcode: map['zipcode'] as String,
        geo: GeoModel.fromMap(map['geo'] as Map<String, dynamic>),
      );
}
