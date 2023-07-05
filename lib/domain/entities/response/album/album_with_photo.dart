import 'package:eds_test/domain/entities/response/album/album_entity.dart';
import 'package:eds_test/domain/entities/response/album/photo_entity.dart';

class AlbumEntityWithPhotos extends AlbumEntity {
  final List<PhotoEntity> photos;

  AlbumEntityWithPhotos({
    required int userId,
    required int id,
    required String title,
    required this.photos,
  }) : super(
          userId: userId,
          id: id,
          title: title,
        );
}
