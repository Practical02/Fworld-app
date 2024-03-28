// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:function_world_app/constants/get_pages_constant.dart';
import 'package:function_world_app/constants/routes_constant.dart';
import 'package:function_world_app/core/app_colors.dart';
import 'package:function_world_app/pages/users/navigation.dart';
import 'package:function_world_app/pages/users/chat_list.dart';
import 'package:function_world_app/pages/users/user_auth/forgot_password.dart';
import 'package:function_world_app/pages/users/user_auth/login.dart';
import 'package:function_world_app/pages/users/user_auth/new_password.dart';
import 'package:function_world_app/pages/users/user_auth/otp_verification.dart';
import 'package:function_world_app/pages/users/user_auth/register.dart';
import 'package:function_world_app/pages/users/user_auth/verification.dart';
import 'package:function_world_app/pages/users/user_intro.dart';
import 'package:function_world_app/pages/vendors/vendor_nav.dart';
import 'package:function_world_app/pages/vendors/vendor_registeration/vendors_register.dart';
import 'package:function_world_app/pages/vendors/vendors_intro.dart';
import 'package:function_world_app/pages/vendors/vendors_login.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Gilroy',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.buttonColor),
          ),
        ),
      ),
      initialRoute: RoutesConstant.userIntro,
      getPages: getPages,
    );
  }
}
