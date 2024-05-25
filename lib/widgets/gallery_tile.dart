import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:function_world_app/widgets/fullscreen_image.dart';
import 'package:get/get.dart';

class GalleryTile extends StatefulWidget {
  final String imageUrl;
  final Function(bool)? onImageLoaded;

  const GalleryTile({
    Key? key,
    required this.imageUrl,
    this.onImageLoaded,
  }) : super(key: key);

  @override
  State<GalleryTile> createState() => _GalleryTileState();
}

class _GalleryTileState extends State<GalleryTile> {
  bool _isImageLoaded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => FullScreenImage(imageUrl: widget.imageUrl));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: widget.imageUrl,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
          imageBuilder: (context, imageProvider) {
            if (!_isImageLoaded && widget.onImageLoaded != null) {
              widget.onImageLoaded!(true);
              _isImageLoaded = true;
            }
            return Image(
              image: imageProvider,
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
