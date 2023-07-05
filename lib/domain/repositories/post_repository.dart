import 'package:eds_test/domain/entities/request/comment_params.dart';
import 'package:eds_test/domain/entities/response/post/comment_entity.dart';
import 'package:eds_test/domain/entities/response/post/post_entity.dart';

abstract class PostRepository {
  Future<List<PostEntity>> fetchPosts();
  Future<void> sendComment(SendCommentParams params);
  Future<List<PostEntity>> fetchPostsByUserId(int userId);
  Future<List<CommentEntity>> fetchComments(int postId);
}
