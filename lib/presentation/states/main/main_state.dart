part of 'main_cubit.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class MainInitial extends MainState {}

class MainLoading extends MainState {}

class MainError extends MainState {
  final HttpError error;

  const MainError(this.error);
}

class MainSucess extends MainState {
  final List<UserEntity> users;

  const MainSucess(this.users);
}
