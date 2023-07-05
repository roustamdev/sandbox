import 'package:eds_test/core/config/api.dart';
import 'package:eds_test/data/models/response/user/user_model.dart';
import 'package:eds_test/dependency_injection.dart';
import 'package:eds_test/shared/services/network_tool/network_interface.dart';

abstract class UserDatasource {
  Future<UserModel> fetchUser(int id);
  Future<List<UserModel>> fetchUsers();
}

class UserRemoteSource implements UserDatasource {
  late final NetworkToolInterface _networkTool = injection.get();
  @override
  Future<UserModel> fetchUser(int id) async {
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> fetchUsers() async {
    final dynamic result = await _networkTool.get(path: Paths.getUsers);
    return List<Map<String, dynamic>>.from(result as List)
        .map(UserModel.fromMap)
        .toList();
  }
}
