import 'package:eds_test/domain/entities/response/post/post_entity.dart';
import 'package:eds_test/presentation/states/post/post_cubit.dart';
import 'package:eds_test/shared/presentation/theme/app_text_styles.dart';
import 'package:eds_test/shared/presentation/widgets/alert.dart';
import 'package:eds_test/shared/presentation/widgets/comment_card.dart';
import 'package:eds_test/shared/presentation/widgets/custom_text_field.dart';
import 'package:eds_test/shared/presentation/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostDetailBody extends StatefulWidget {
  final PostEntity post;

  const PostDetailBody({
    required this.post,
    Key? key,
  }) : super(key: key);

  @override
  _PostDetailBodyState createState() => _PostDetailBodyState();
}

class _PostDetailBodyState extends State<PostDetailBody> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _clearText() {
    nameController.clear();
    emailController.clear();
    commentController.clear();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    commentController.dispose();
    super.dispose();
  }

  Future<void> _displayDialog(BuildContext context, Function() onTap) async {
    return showDialog(
      context: context,
      builder: (context) {
        return Builder(builder: (context) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            scrollable: true,
            title: const Text('Add new comment'),
            content: SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: nameController,
                      prefixIcon: const Icon(Icons.person),
                      hintText: 'Name',
                      validatorMessage: 'Name cannot be empty',
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: emailController,
                      prefixIcon: const Icon(Icons.email),
                      hintText: 'E-mail',
                      validatorMessage: 'Email cannot be empty',
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: commentController,
                      prefixIcon: const Icon(Icons.message),
                      hintText: 'Comment',
                      validatorMessage: 'Comment cannot be empty',
                    )
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Submit'),
                onPressed: onTap,
              )
            ],
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Stack(
        children: [
          BlocConsumer<PostCubit, PostState>(
            listener: (context, state) {
              if (state is PostError) {
                AppAlert.show(
                  context,
                  title: 'Error',
                  content: state.error.message,
                );
              }
            },
            builder: (context, state) {
              if (state is PostLoading) {
                return const Loader();
              }
              if (state is PostSuccess) {
                return ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Text(
                      widget.post.title,
                      style: AppTextStyles.title.copyWith(
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 7),
                    Text(
                      widget.post.body,
                      style: AppTextStyles.bodyTextStyle.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text('Comments:'),
                    const SizedBox(
                      height: 8,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final comment = state.comments[index];
                        return CommentCard(
                          username: comment.name,
                          comment: comment.body,
                          email: comment.email,
                        );
                      },
                      itemCount: state.comments.length,
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
          Positioned(
            bottom: 50,
            right: 20,
            child: FloatingActionButton(
              child: const Icon(
                Icons.add,
                size: 20,
              ),
              onPressed: () => _displayDialog(context, () {
                context.read<PostCubit>().sendComment(
                      name: nameController.text,
                      email: emailController.text,
                      body: commentController.text,
                      id: widget.post.id,
                    );
                Navigator.of(context).pop();
                _clearText();
              }),
            ),
          )
        ],
      );
    });
  }
}
