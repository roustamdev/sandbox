import 'package:eds_test/core/config/api.dart';
import 'package:eds_test/data/models/response/album/album_model.dart';
import 'package:eds_test/data/models/response/album/album_with_photos.dart';
import 'package:eds_test/data/models/response/album/photo_model.dart';
import 'package:eds_test/dependency_injection.dart';
import 'package:eds_test/shared/services/network_tool/network_interface.dart';

abstract class AlbumRemotesource {
  Future<List<PhotoModel>> fetchAllPhotos();
  Future<List<PhotoModel>> fetchPhotosByAlbumId(int albumId);
  Future<List<AlbumModel>> fetchAllAlbums();
  Future<List<AlbumModel>> fetchAlbumsByUserId(int userId);
  Future<List<AlbumModelWithPhotosModel>> fetchAlbumsByUserIdWithPhotos(
    int userId,
  );
}

class AlbumRemoteSourceImpl implements AlbumRemotesource {
  late final NetworkToolInterface _networkTool = injection.get();

  @override
  Future<List<PhotoModel>> fetchAllPhotos() async {
    final dynamic result = await _networkTool.get(path: Paths.photos);
    return List<Map<String, dynamic>>.from(result as List)
        .map(PhotoModel.fromMap)
        .toList();
  }

  @override
  Future<List<PhotoModel>> fetchPhotosByAlbumId(int albumId) async {
    final dynamic result = await _networkTool.get(
      path: Paths.getPhotoByAlbumId(albumId.toString()),
    );
    return List<Map<String, dynamic>>.from(result as List)
        .map(PhotoModel.fromMap)
        .toList();
  }

  @override
  Future<List<AlbumModel>> fetchAllAlbums() async {
    final dynamic result = await _networkTool.get(path: Paths.albums);
    return List<Map<String, dynamic>>.from(result as List)
        .map(AlbumModel.fromMap)
        .toList();
  }

  @override
  Future<List<AlbumModel>> fetchAlbumsByUserId(int userId) async {
    final dynamic result = await _networkTool.get(
      path: Paths.getAlbumsByUserId(userId.toString()),
    );
    return List<Map<String, dynamic>>.from(result as List)
        .map(AlbumModel.fromMap)
        .toList();
  }

  @override
  Future<List<AlbumModelWithPhotosModel>> fetchAlbumsByUserIdWithPhotos(
    int userId,
  ) async {
    try {
      var result = await _networkTool.get(
        path: Paths.getAlbumsWithPhotoByUserId(userId.toString()),
      );
      return List<Map<String, dynamic>>.from(result as List)
          .map(AlbumModelWithPhotosModel.fromMap)
          .toList();
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
