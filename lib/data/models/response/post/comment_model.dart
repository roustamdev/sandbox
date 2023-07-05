
import 'package:eds_test/domain/entities/response/post/comment_entity.dart';

class CommentModel extends CommentEntity {
  CommentModel({
    required super.postId,
    required super.id,
    required super.name,
    required super.email,
    required super.body,
  });

  factory CommentModel.fromMap(Map<String, dynamic> map) => CommentModel(
        postId: map['postId'] as int,
        id: map['id'] as int,
        name: map['name'] as String,
        email: map['email'] as String,
        body: map['body'] as String,
      );
}
