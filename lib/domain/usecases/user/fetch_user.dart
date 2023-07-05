import 'package:eds_test/dependency_injection.dart';
import 'package:eds_test/domain/entities/response/user/user_entity.dart';
import 'package:eds_test/domain/repositories/user_repository.dart';
import 'package:eds_test/shared/domain/usecase.dart';

//one user
class FetchUser implements UseCase<int, UserEntity> {
  late final UserRepository _userRepository = injection.get();

  @override
  Future<UserEntity> call(int userId) {
    return _userRepository.fetchUser(userId);
  }
}
