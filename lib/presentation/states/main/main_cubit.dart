import 'package:eds_test/core/failures/failure.dart';
import 'package:eds_test/dependency_injection.dart';
import 'package:eds_test/domain/entities/response/user/user_entity.dart';
import 'package:eds_test/domain/usecases/user/fetch_users.dart';
import 'package:eds_test/shared/domain/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  late final FetchUsers _fetchUsers = injection.get();
  Future<void> getUsers() async {
    emit(MainLoading());
    try {
      final users = await _fetchUsers(NoParams());
      emit(MainSucess(users));
    } on HttpError catch (e) {
      emit(MainError(e));
    }
  }
}
