import 'package:eds_test/data/datasources/remote/post_remote_source.dart';
import 'package:eds_test/data/models/request/send_comment.dart';
import 'package:eds_test/dependency_injection.dart';
import 'package:eds_test/domain/entities/request/comment_params.dart';
import 'package:eds_test/domain/entities/response/post/comment_entity.dart';
import 'package:eds_test/domain/entities/response/post/post_entity.dart';
import 'package:eds_test/domain/repositories/post_repository.dart';

class PostRepoImpl implements PostRepository {
  late final PostRemotesource _postRemotesource = injection.get();
  @override
  Future<List<CommentEntity>> fetchComments(int postId) {
    return _postRemotesource.fetchCommentsByPostId(postId);
  }

  @override
  Future<List<PostEntity>> fetchPosts() {
    return _postRemotesource.fetchAllPosts();
  }

  @override
  Future<List<PostEntity>> fetchPostsByUserId(int userId) {
    return _postRemotesource.fetchPostsByUserId(userId);
  }

  @override
  Future<void> sendComment(SendCommentParams params) {
    return _postRemotesource
        .sendComment(SendCommentRequestModel.fromDomain(params));
  }
}
