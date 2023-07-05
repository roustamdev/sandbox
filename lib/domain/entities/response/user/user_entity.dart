import 'package:eds_test/domain/entities/response/user/adress/adress_entity.dart';
import 'package:eds_test/domain/entities/response/user/company_entity.dart';

class UserEntity {
  final int id;
  final String name;
  final String username;
  final String email;
  final AddressEntity address;
  final String phone;
  final String website;
  final CompanyEntity company;

  UserEntity({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });
}
