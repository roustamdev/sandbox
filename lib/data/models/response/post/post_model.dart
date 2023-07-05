
import 'package:eds_test/domain/entities/response/post/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({
    required super.userId,
    required super.id,
    required super.title,
    required super.body,
  });

  factory PostModel.fromMap(Map<String, dynamic> map) => PostModel(
        userId: map['userId'] as int,
        id: map['id'] as int,
        title: map['title'] as String,
        body: map['body'] as String,
      );
}
