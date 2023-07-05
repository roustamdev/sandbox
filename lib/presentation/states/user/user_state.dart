part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserError extends UserState {
  final HttpError error;

  const UserError(this.error);
}

class UserSuccess extends UserState {
  final List<PostEntity> posts;
  final List<AlbumEntityWithPhotos> albums;

  const UserSuccess(this.posts, this.albums);
}
