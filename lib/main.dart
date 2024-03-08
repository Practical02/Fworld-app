// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:function_world_app/core/app_colors.dart';
import 'package:function_world_app/pages/navigation.dart';
import 'package:function_world_app/pages/users/chat_list.dart';

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
      home: SafeArea(child: NavigationScreen()),
      routes: {
        ChatUSersScreen.routeName: (context) => ChatUSersScreen(),
      },
    );
  }
}
