import 'package:eds_test/data/models/response/user/adress/adress_model.dart';
import 'package:eds_test/data/models/response/user/company_model.dart';
import 'package:eds_test/domain/entities/response/user/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.username,
    required super.email,
    required super.address,
    required super.phone,
    required super.website,
    required super.company,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        id: map['id'] as int,
        name: map['name'] as String,
        username: map['username'] as String,
        email: map['email'] as String,
        address: AddressModel.fromMap(map['address'] as Map<String, dynamic>),
        phone: map['phone'] as String,
        website: map['website'] as String,
        company: CompanyModel.fromMap(map['company'] as Map<String, dynamic>),
      );
}
