import 'package:eds_test/dependency_injection.dart';
import 'package:eds_test/domain/entities/response/post/comment_entity.dart';
import 'package:eds_test/domain/repositories/post_repository.dart';
import 'package:eds_test/shared/domain/usecase.dart';

class FetchPostCommentsUseCase extends UseCase<int, List<CommentEntity>> {
  late final PostRepository _postRepository = injection.get();
  @override
  Future<List<CommentEntity>> call(int params) {
    return _postRepository.fetchComments(params);
  }
}
