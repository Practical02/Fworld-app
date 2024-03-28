// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
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
import 'package:function_world_app/pages/vendors/vendor_profile.dart';
import 'package:function_world_app/pages/vendors/vendor_profile_edit.dart';
import 'package:function_world_app/pages/vendors/vendor_registeration/vendor_gallery.dart';
import 'package:function_world_app/pages/vendors/vendor_registeration/vendor_payment.dart';
import 'package:function_world_app/pages/vendors/vendor_registeration/vendor_portfolio.dart';
import 'package:function_world_app/pages/vendors/vendor_registeration/vendor_social.dart';
import 'package:function_world_app/pages/vendors/vendor_registeration/vendor_welcome.dart';
import 'package:function_world_app/pages/vendors/vendor_registeration/vendors_register.dart';
import 'package:function_world_app/pages/vendors/vendors_intro.dart';
import 'package:function_world_app/pages/vendors/vendors_login.dart';

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
        VendorsIntro.routeName: (context) => VendorsIntro(),
        VendorLogin.routeName: (context) => VendorLogin(),
        VendorNavigationScreen.routeName: (context) => VendorNavigationScreen(),
        VendorRegistration.routeName: (context) => VendorRegistration(),
        EmailVerificationScreen.routeName: (context) =>
            EmailVerificationScreen(),
        VendorGallery.routeName: (context) => VendorGallery(),
        VendorPaymentGatewayScreen.routeName: (context) =>
            VendorPaymentGatewayScreen(),
        VendorPortfolio.routeName: (context) => VendorPortfolio(),
        VendorSocial.routeName: (context) => VendorSocial(),
        VendorsWelcome.routeName: (context) => VendorsWelcome(),
        VendorProfile.routeName: (context) => VendorProfile(),
        VendorProfileEdit.routeName: (context) => VendorProfileEdit(),
      },
    );
  }
}
