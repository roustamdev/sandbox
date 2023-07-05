import 'package:eds_test/core/config/api.dart';
import 'package:eds_test/data/models/request/send_comment.dart';
import 'package:eds_test/data/models/response/post/comment_model.dart';
import 'package:eds_test/data/models/response/post/post_model.dart';
import 'package:eds_test/dependency_injection.dart';
import 'package:eds_test/shared/services/network_tool/network_interface.dart';

abstract class PostRemotesource {
  Future<List<PostModel>> fetchAllPosts();
  Future<List<PostModel>> fetchPostsByUserId(int userId);
  Future<List<CommentModel>> fetchAllComments();
  Future<List<CommentModel>> fetchCommentsByPostId(int postId);
  Future<void> sendComment(SendCommentRequestModel params);
}

class PostRemoteSourceImpl implements PostRemotesource {
  late final NetworkToolInterface _networkTool = injection.get();

  @override
  Future<List<PostModel>> fetchAllPosts() async {
    final dynamic result = await _networkTool.get(path: Paths.getAllPosts);
    return List<Map<String, dynamic>>.from(result as List)
        .map(PostModel.fromMap)
        .toList();
  }

  @override
  Future<List<PostModel>> fetchPostsByUserId(int id) async {
    final dynamic result =
        await _networkTool.get(path: Paths.getPostByUserId(id.toString()));
    return List<Map<String, dynamic>>.from(result as List)
        .map(PostModel.fromMap)
        .toList();
  }

  @override
  Future<List<CommentModel>> fetchAllComments() async {
    final dynamic result = await _networkTool.get(path: Paths.comments);
    return List<Map<String, dynamic>>.from(result as List)
        .map(CommentModel.fromMap)
        .toList();
  }

  @override
  Future<List<CommentModel>> fetchCommentsByPostId(int postId) async {
    final dynamic result = await _networkTool.get(
      path: Paths.getCommentsByPostId(postId.toString()),
    );
    return List<Map<String, dynamic>>.from(result as List)
        .map(CommentModel.fromMap)
        .toList();
  }

  @override
  Future<void> sendComment(SendCommentRequestModel params) async {
    await _networkTool.post(path: Paths.comments, body: params.toMap());
  }
}
