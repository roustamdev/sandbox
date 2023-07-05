import 'package:eds_test/dependency_injection.dart';
import 'package:eds_test/domain/entities/response/post/post_entity.dart';
import 'package:eds_test/domain/repositories/post_repository.dart';
import 'package:eds_test/shared/domain/usecase.dart';

class FetchUserPostsUseCase extends UseCase<int, List<PostEntity>> {
  late final PostRepository _postRepository = injection.get();
  @override
  Future<List<PostEntity>> call(int params) {
    return _postRepository.fetchPostsByUserId(params);
  }
}
