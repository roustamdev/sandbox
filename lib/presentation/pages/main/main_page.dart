import 'package:eds_test/presentation/pages/main/main_body.dart';
import 'package:eds_test/presentation/states/main/main_cubit.dart';
import 'package:eds_test/shared/presentation/theme/app_colors.dart';
import 'package:eds_test/shared/presentation/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('All Users'),
        centerTitle: true,
        titleTextStyle: AppTextStyles.title,
        backgroundColor: AppColors.gray,
      ),
      body: BlocProvider(
        create: (context) => MainCubit()..getUsers(),
        child: const MainBody(),
      ),
    );
  }
}
