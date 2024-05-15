// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:function_world_app/constants/routes_constant.dart';
import 'package:function_world_app/core/app_colors.dart';
import 'package:get/get.dart';

class SearchTile extends StatelessWidget {
  final String id;
  final String name;
  const SearchTile({
    super.key,
    required this.id,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      onTap: () {
        Get.toNamed(RoutesConstant.userVendorProfile, arguments: {'vendorID': id});
      },
    );
  }
}