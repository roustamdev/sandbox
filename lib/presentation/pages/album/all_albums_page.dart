import 'package:eds_test/domain/entities/response/album/album_with_photo.dart';
import 'package:eds_test/domain/entities/response/user/user_entity.dart';
import 'package:eds_test/shared/presentation/theme/app_colors.dart';
import 'package:eds_test/shared/presentation/theme/app_text_styles.dart';
import 'package:eds_test/shared/presentation/widgets/album_card.dart';
import 'package:flutter/material.dart';

import 'album_detail_page.dart';

class AllAlbumsPage extends StatelessWidget {
  final UserEntity user;
  final List<AlbumEntityWithPhotos> albums;

  const AllAlbumsPage({
    required this.user,
    required this.albums,
    Key? key,
  }) : super(key: key);

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
      body: ListView.builder(
        itemCount: albums.length,
        itemBuilder: (context, index) {
          final album = albums[index];
          return GestureDetector(
            child: AlbumCard(
              album: album,
            ),
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
          );
        },
      ),
    );
  }
}
