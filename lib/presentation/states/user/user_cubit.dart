import 'package:eds_test/core/failures/failure.dart';
import 'package:eds_test/dependency_injection.dart';
import 'package:eds_test/domain/entities/response/album/album_with_photo.dart';
import 'package:eds_test/domain/entities/response/post/post_entity.dart';
import 'package:eds_test/domain/usecases/album/fetch_user_alboms.dart';
import 'package:eds_test/domain/usecases/post/fetch_user_posts.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  late final FetchUserPostsUseCase _fetchUserPostsUseCase = injection.get();
  late final FetchAlbumsByUserIdWithPhotosUseCase
      _albumsByUserIdWithPhotosUseCase = injection.get();
  fetchUserData(int userId) async {
    emit(UserLoading());
    try {
      final posts = await _fetchUserPostsUseCase(userId);
      final albums = await _albumsByUserIdWithPhotosUseCase(userId);
      emit(UserSuccess(posts, albums));
    } on HttpError catch (e) {
      emit(UserError(e));
    }
  }
}
