import 'package:eds_test/data/models/response/album/photo_model.dart';
import 'package:eds_test/domain/entities/response/album/album_with_photo.dart';

class AlbumModelWithPhotosModel extends AlbumEntityWithPhotos {
  AlbumModelWithPhotosModel({
    required super.userId,
    required super.id,
    required super.title,
    required super.photos,
  });

  factory AlbumModelWithPhotosModel.fromMap(Map<String, dynamic> map) =>
      AlbumModelWithPhotosModel(
        userId: map['userId'] as int,
        id: map['id'] as int,
        title: map['title'] as String,
        photos: List<PhotoModel>.from(
          List<Map<String, dynamic>>.from(map['photos'] as List)
              .map<PhotoModel>(PhotoModel.fromMap),
        ),
      );
}
