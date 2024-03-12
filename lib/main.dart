// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:function_world_app/core/app_colors.dart';
import 'package:function_world_app/pages/navigation.dart';
import 'package:function_world_app/pages/users/chat_list.dart';
import 'package:function_world_app/pages/users/user_auth/forgot_password.dart';
import 'package:function_world_app/pages/users/user_auth/login.dart';
import 'package:function_world_app/pages/users/user_auth/new_password.dart';
import 'package:function_world_app/pages/users/user_auth/otp_verification.dart';
import 'package:function_world_app/pages/users/user_auth/register.dart';
import 'package:function_world_app/pages/users/user_auth/verification.dart';
import 'package:function_world_app/pages/users/user_intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: SafeArea(child: UserIntro()),
      routes: {
        ChatUSersScreen.routeName: (context) => ChatUSersScreen(),
        UserLogin.routeName: (context) => UserLogin(),
        UserRegistration.routeName: (context) => UserRegistration(),
        EmailVerificationScreen.routeName: (context) =>
            EmailVerificationScreen(),
        ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
        OTPVerificationScreen.routeName: (context) => OTPVerificationScreen(),
        PasswordResetScreen.routeName: (context) => PasswordResetScreen(),
        NavigationScreen.routeName: (context) => NavigationScreen(),
      },
    );
  }
}
