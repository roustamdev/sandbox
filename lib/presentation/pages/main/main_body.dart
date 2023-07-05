import 'package:eds_test/presentation/pages/user/user_page.dart';
import 'package:eds_test/presentation/states/main/main_cubit.dart';
import 'package:eds_test/shared/presentation/theme/app_colors.dart';
import 'package:eds_test/shared/presentation/theme/app_text_styles.dart';
import 'package:eds_test/shared/presentation/widgets/alert.dart';
import 'package:eds_test/shared/presentation/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBody extends StatelessWidget {
  const MainBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        if (state is MainError) {
          AppAlert.show(context, title: 'Error', content: state.error.message);
        }
      },
      builder: (context, state) {
        if (state is MainLoading) {
          return const Loader();
        } else if (state is MainSucess) {
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: state.users.length,
            separatorBuilder: (_, __) => const SizedBox(
              height: 12,
            ),
            itemBuilder: (context, index) {
              final user = state.users[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserPage(
                        user: user,
                      ),
                    ),
                  );
                },
                child: Container(
                  color: AppColors.gray,
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    horizontalTitleGap: 8,
                    title: Text(
                      user.username,
                      style: AppTextStyles.title,
                    ),
                    subtitle: Text(
                      user.name,
                      style: AppTextStyles.subtitle,
                    ),
                    leading: const Icon(
                      Icons.person,
                      size: 32,
                      color: AppColors.white,
                    ),
                  ),
                ),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
