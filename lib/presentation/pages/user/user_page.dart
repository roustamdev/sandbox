import 'package:eds_test/domain/entities/response/user/user_entity.dart';
import 'package:eds_test/presentation/pages/user/user_body.dart';
import 'package:eds_test/presentation/states/user/user_cubit.dart';
import 'package:eds_test/shared/presentation/theme/app_colors.dart';
import 'package:eds_test/shared/presentation/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key, required this.user});
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(user.username),
        centerTitle: true,
        titleTextStyle: AppTextStyles.title,
        backgroundColor: AppColors.gray,
      ),
      body: BlocProvider(
        create: (context) => UserCubit()..fetchUserData(user.id),
        child: UserBody(user: user),
      ),
    );
  }
}
