part of 'post_cubit.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostError extends PostState {
  final HttpError error;

  const PostError(this.error);
}

class PostSuccess extends PostState {
  final List<CommentEntity> comments;

  const PostSuccess(this.comments);
}
