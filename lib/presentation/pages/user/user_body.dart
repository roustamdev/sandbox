import 'package:eds_test/domain/entities/response/user/user_entity.dart';
import 'package:eds_test/presentation/pages/album/album_detail_page.dart';
import 'package:eds_test/presentation/pages/album/all_albums_page.dart';
import 'package:eds_test/presentation/pages/post/all_posts_page.dart';
import 'package:eds_test/presentation/pages/post/post_detail_page.dart';
import 'package:eds_test/presentation/states/user/user_cubit.dart';
import 'package:eds_test/shared/presentation/theme/app_text_styles.dart';
import 'package:eds_test/shared/presentation/widgets/album_card.dart';
import 'package:eds_test/shared/presentation/widgets/alert.dart';
import 'package:eds_test/shared/presentation/widgets/loader.dart';
import 'package:eds_test/shared/presentation/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBody extends StatelessWidget {
  const UserBody({
    super.key,
    required this.user,
  });
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name: ${user.name}',
            style: AppTextStyles.bodyTextStyle,
          ),
          const SizedBox(height: 16),
          Text(
            'Email: ${user.email}',
            style: AppTextStyles.bodyTextStyle,
          ),
          const SizedBox(height: 16),
          Text(
            'Phone: ${user.phone}',
            style: AppTextStyles.bodyTextStyle,
          ),
          const SizedBox(height: 16),
          Text(
            'Website: ${user.website}',
            style: AppTextStyles.bodyTextStyle,
          ),
          const SizedBox(height: 16),
          Text(
            'Working Company',
            style: AppTextStyles.bodyTextStyle,
          ),
          const SizedBox(height: 7),
          Text(
            'Name: ${user.company.name}',
            style: AppTextStyles.bodyTextStyle,
          ),
          const SizedBox(height: 7),
          Text(
            'BS: ${user.company.bs}',
            style: AppTextStyles.bodyTextStyle,
          ),
          const SizedBox(height: 7),
          Text(
            "Catch phase: '${user.company.catchPhrase}'",
            style: AppTextStyles.bodyTextStyle,
          ),
          const SizedBox(height: 16),
          Text(
            'Address',
            style: AppTextStyles.bodyTextStyle,
          ),
          const SizedBox(height: 7),
          Text(
            'City: ${user.address.city}',
            style: AppTextStyles.bodyTextStyle,
          ),
          const SizedBox(height: 7),
          Text(
            'Street: ${user.address.street}',
            style: AppTextStyles.bodyTextStyle,
          ),
          const SizedBox(height: 16),
          BlocConsumer<UserCubit, UserState>(
            listener: (context, state) {
              if (state is UserError) {
                AppAlert.show(
                  context,
                  title: 'Error',
                  content: state.error.message,
                );
              }
            },
            builder: (context, state) {
              if (state is UserLoading) {
                return const Loader();
              }
              if (state is UserSuccess) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'User Posts',
                            style: AppTextStyles.bodyTextStyle,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AllPostsPage(
                                  user: user,
                                  posts: state.posts,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_right_alt_outlined,
                            size: 30,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    ListView.separated(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (_, __) => const SizedBox(
                        height: 16,
                      ),
                      itemBuilder: (context, index) {
                        final post = state.posts[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostDetailPage(
                                  post: post,
                                ),
                              ),
                            );
                          },
                          child: PostCard(
                            post: post,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'User Albums',
                            style: AppTextStyles.bodyTextStyle,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AllAlbumsPage(
                                  user: user,
                                  albums: state.albums,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_right_alt_outlined,
                            size: 30,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    ListView.separated(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (_, __) => const SizedBox(
                        height: 16,
                      ),
                      itemBuilder: (context, index) {
                        final album = state.albums[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AlbumDetailPage(
                                  album: album,
                                ),
                              ),
                            );
                          },
                          child: AlbumCard(
                            album: album,
                          ),
                        );
                      },
                    ),
                  ],
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
