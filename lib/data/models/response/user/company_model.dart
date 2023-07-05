import 'package:eds_test/domain/entities/response/user/company_entity.dart';

class CompanyModel extends CompanyEntity {
  CompanyModel({
    required super.name,
    required super.catchPhrase,
    required super.bs,
  });

  factory CompanyModel.fromMap(Map<String, dynamic> map) => CompanyModel(
        name: map['name'] as String,
        catchPhrase: map['catchPhrase'] as String,
        bs: map['bs'] as String,
      );
}
