import 'package:eds_test/domain/entities/response/album/album_with_photo.dart';
import 'package:flutter/material.dart';

class AlbumCard extends StatelessWidget {
  final AlbumEntityWithPhotos album;

  const AlbumCard({
    required this.album,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size.width;
    final thumbSize = (mq - (16 * 2)) / 3;
    return Row(
      children: [
        Container(
          width: thumbSize,
          height: thumbSize,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                album.photos.first.thumbnailUrl,
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(album.title),
        ),
      ],
    );
  }
}
