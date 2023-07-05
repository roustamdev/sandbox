import 'package:eds_test/data/datasources/remote/album_remote_source.dart';
import 'package:eds_test/dependency_injection.dart';
import 'package:eds_test/domain/entities/response/album/album_entity.dart';
import 'package:eds_test/domain/entities/response/album/album_with_photo.dart';
import 'package:eds_test/domain/entities/response/album/photo_entity.dart';
import 'package:eds_test/domain/repositories/album_repository.dart';

final AlbumRemotesource _albumRemotesource = injection.get();

class AlbumRepoImpl implements AlbumRepository {
  @override
  Future<List<AlbumEntity>> fetchAlbumsByUserId(int userId) {
    return _albumRemotesource.fetchAlbumsByUserId(userId);
  }

  @override
  Future<List<AlbumEntityWithPhotos>> fetchAlbumsByUserIdWithPhotos(
    int userId,
  ) {
    return _albumRemotesource.fetchAlbumsByUserIdWithPhotos(userId);
  }

  @override
  Future<List<AlbumEntity>> fetchAllAlbums() {
    return _albumRemotesource.fetchAllAlbums();
  }

  @override
  Future<List<PhotoEntity>> fetchAllPhotos() {
    return _albumRemotesource.fetchAllPhotos();
  }

  @override
  Future<List<PhotoEntity>> fetchPhotosByAlbumId(int albumId) {
    return _albumRemotesource.fetchPhotosByAlbumId(albumId);
  }
}
