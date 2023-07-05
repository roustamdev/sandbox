import 'package:eds_test/domain/entities/response/post/post_entity.dart';
import 'package:eds_test/presentation/pages/post/post_detail_body.dart';
import 'package:eds_test/presentation/states/post/post_cubit.dart';
import 'package:eds_test/shared/presentation/theme/app_colors.dart';
import 'package:eds_test/shared/presentation/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({super.key, required this.post});
  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
        centerTitle: true,
        titleTextStyle: AppTextStyles.title,
        backgroundColor: AppColors.gray,
      ),
      body: BlocProvider(
        create: (context) => PostCubit()..fetchCommentPosts(post.userId),
        child: PostDetailBody(post: post),
      ),
    );
  }
}
