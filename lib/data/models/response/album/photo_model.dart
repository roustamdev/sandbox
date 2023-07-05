import 'package:eds_test/domain/entities/response/album/photo_entity.dart';

class PhotoModel extends PhotoEntity {
  PhotoModel({
    required super.albumId,
    required super.id,
    required super.title,
    required super.url,
    required super.thumbnailUrl,
  });

  factory PhotoModel.fromMap(Map<String, dynamic> map) => PhotoModel(
        albumId: map['albumId'] as int,
        id: map['id'] as int,
        title: map['title'] as String,
        url: '${map['url']}.jpg',
        thumbnailUrl: '${map['thumbnailUrl']}.jpg',
      );
}
