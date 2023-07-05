import 'package:eds_test/domain/entities/response/user/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> fetchUsers();
  Future<UserEntity> fetchUser(int id);
}
