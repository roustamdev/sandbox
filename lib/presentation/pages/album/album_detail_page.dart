import 'package:carousel_slider/carousel_slider.dart';
import 'package:eds_test/domain/entities/response/album/album_with_photo.dart';
import 'package:eds_test/shared/presentation/theme/app_colors.dart';
import 'package:eds_test/shared/presentation/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AlbumDetailPage extends StatelessWidget {
  final AlbumEntityWithPhotos album;
  const AlbumDetailPage({
    required this.album,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(album.title),
        titleTextStyle: AppTextStyles.title,
        backgroundColor: AppColors.gray,
      ),
      body: Center(
        child: CarouselSlider.builder(
          itemCount: album.photos.length,
          itemBuilder: (context, index, _) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Image(
                    image: NetworkImage(
                      album.photos[index].url,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(album.photos[index].title)
                ],
              ),
            );
          },
          options: CarouselOptions(height: 400),
        ),
      ),
    );
  }
}
