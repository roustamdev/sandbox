import 'package:eds_test/data/datasources/remote/user_remote_source.dart';
import 'package:eds_test/dependency_injection.dart';
import 'package:eds_test/domain/entities/response/user/user_entity.dart';
import 'package:eds_test/domain/repositories/user_repository.dart';

class UserRepoImpl implements UserRepository {
  late final UserDatasource _userDatasource = injection.get();

  @override
  Future<UserEntity> fetchUser(int id) {
    return _userDatasource.fetchUser(id);
  }

  @override
  Future<List<UserEntity>> fetchUsers() {
    return _userDatasource.fetchUsers();
  }
}
