import 'package:eds_test/domain/entities/response/album/album_entity.dart';
import 'package:eds_test/domain/entities/response/album/album_with_photo.dart';
import 'package:eds_test/domain/entities/response/album/photo_entity.dart';

abstract class AlbumRepository {
  Future<List<PhotoEntity>> fetchAllPhotos();
  Future<List<PhotoEntity>> fetchPhotosByAlbumId(int albumId);
  Future<List<AlbumEntity>> fetchAllAlbums();
  Future<List<AlbumEntity>> fetchAlbumsByUserId(int userId);
  Future<List<AlbumEntityWithPhotos>> fetchAlbumsByUserIdWithPhotos(
    int userId,
  );
}
