import 'package:eds_test/core/failures/failure.dart';
import 'package:eds_test/dependency_injection.dart';
import 'package:eds_test/domain/entities/request/comment_params.dart';
import 'package:eds_test/domain/entities/response/post/comment_entity.dart';
import 'package:eds_test/domain/usecases/post/fetch_post_comments.dart';
import 'package:eds_test/domain/usecases/post/send_comment_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());
  late final FetchPostCommentsUseCase _fetchPostCommentsUseCase =
      injection.get();
  late final SendCommentUseCase _sendCommentUseCase = injection.get();
  Future<void> fetchCommentPosts(int postId) async {
    try {
      emit(PostLoading());
      final comments = await _fetchPostCommentsUseCase(postId);
      emit(PostSuccess(comments));
    } on HttpError catch (e) {
      emit(PostError(e));
    }
  }

  Future<void> sendComment({
    required String name,
    required String email,
    required String body,
    required int id,
  }) async {
    try {
      emit(PostLoading());
      await _sendCommentUseCase(
        SendCommentParams(name: name, email: email, body: body),
      );

      final comments = await _fetchPostCommentsUseCase(id);
      emit(PostSuccess(comments));
    } on HttpError catch (e) {
      emit(
        PostError(e),
      );
    }
  }
}
