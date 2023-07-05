import 'package:eds_test/dependency_injection.dart';
import 'package:eds_test/domain/entities/response/user/user_entity.dart';
import 'package:eds_test/domain/repositories/user_repository.dart';
import 'package:eds_test/shared/domain/usecase.dart';

class FetchUsers implements UseCase<NoParams, List<UserEntity>> {
  late final UserRepository _userRepository = injection.get();

  @override
  Future<List<UserEntity>> call(NoParams params) {
    return _userRepository.fetchUsers();
  }
}
