// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:function_world_app/core/app_colors.dart';

class GalleryTile extends StatelessWidget {
  final String imageUrl;

  const GalleryTile({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image(
        image: NetworkImage(imageUrl),
        fit: BoxFit.cover,
      ),
    );
  }
}
