// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GalleryTile extends StatefulWidget {
  final String imageUrl;
  final Function(bool)? onImageLoaded;

  const GalleryTile({
    Key? key,
    required this.imageUrl,
    this.onImageLoaded
  }) : super(key: key);

  @override
  State<GalleryTile> createState() => _GalleryTileState();
}

class _GalleryTileState extends State<GalleryTile> {
  bool _isImageLoaded = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
            imageUrl: widget.imageUrl,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
            imageBuilder: (context, imageProvider) {
              // Image loaded callback
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
    );
  }
}
// class GalleryTile extends StatelessWidget {
//   final String imageUrl;

//   const GalleryTile({
//     super.key,
//     required this.imageUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(10),
//       child: Image(
//         image: NetworkImage(imageUrl),
//         fit: BoxFit.cover,
//       ),
//     );
//   }
// }
