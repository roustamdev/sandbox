
import 'package:eds_test/domain/entities/response/album/album_entity.dart';

class AlbumModel extends AlbumEntity {
  AlbumModel({
    required super.userId,
    required super.id,
    required super.title,
  });

  factory AlbumModel.fromMap(Map<String, dynamic> map) => AlbumModel(
        userId: map['userId'] as int,
        id: map['id'] as int,
        title: map['title'] as String,
      );
}
