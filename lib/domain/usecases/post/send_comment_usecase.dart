import 'package:eds_test/dependency_injection.dart';
import 'package:eds_test/domain/entities/request/comment_params.dart';
import 'package:eds_test/domain/repositories/post_repository.dart';
import 'package:eds_test/shared/domain/usecase.dart';

class SendCommentUseCase extends UseCase<SendCommentParams, void> {
  late final PostRepository _postRepository = injection.get();
  @override
  Future<void> call(SendCommentParams params) {
    return _postRepository.sendComment(params);
  }
}
