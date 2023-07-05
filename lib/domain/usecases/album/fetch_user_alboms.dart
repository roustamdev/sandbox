import 'package:eds_test/dependency_injection.dart';
import 'package:eds_test/domain/entities/response/album/album_with_photo.dart';
import 'package:eds_test/domain/repositories/album_repository.dart';
import 'package:eds_test/shared/domain/usecase.dart';

class FetchAlbumsByUserIdWithPhotosUseCase
    extends UseCase<int, List<AlbumEntityWithPhotos>> {
  late final AlbumRepository _albumRepository = injection.get();
  @override
  Future<List<AlbumEntityWithPhotos>> call(int params) {
    return _albumRepository.fetchAlbumsByUserIdWithPhotos(params);
  }
}
