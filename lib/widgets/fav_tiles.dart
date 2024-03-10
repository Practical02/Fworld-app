// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:function_world_app/core/app_colors.dart';

class FavTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subTitle;
  const FavTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
          height: 200,
        ),
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              width: double.maxFinite,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.buttonColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 11,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          subTitle,
                          style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
