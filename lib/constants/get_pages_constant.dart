import 'package:function_world_app/constants/routes_constant.dart';
import 'package:function_world_app/pages/users/chat_list.dart';
import 'package:function_world_app/pages/users/navigation.dart';
import 'package:function_world_app/pages/users/user_auth/forgot_password.dart';
import 'package:function_world_app/pages/users/user_auth/login.dart';
import 'package:function_world_app/pages/users/user_auth/new_password.dart';
import 'package:function_world_app/pages/users/user_auth/otp_verification.dart';
import 'package:function_world_app/pages/users/user_auth/register.dart';
import 'package:function_world_app/pages/users/user_auth/verification.dart';
import 'package:function_world_app/pages/users/user_chat.dart';
import 'package:function_world_app/pages/users/user_intro.dart';
import 'package:function_world_app/pages/users/vendor_profile.dart';
import 'package:function_world_app/pages/vendors/vendor_nav.dart';
import 'package:function_world_app/pages/vendors/vendor_registeration/vendors_register.dart';
import 'package:function_world_app/pages/vendors/vendors_intro.dart';
import 'package:function_world_app/pages/vendors/vendors_login.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

final getPages = [
  GetPage(name: RoutesConstant.userIntro, page: () => const UserIntro()),
  GetPage(
      name: RoutesConstant.userRegister, page: () => const UserRegistration()),
  GetPage(name: RoutesConstant.userLogin, page: () => const UserLogin()),
  GetPage(
      name: RoutesConstant.userNavigation,
      page: () => const NavigationScreen()),
  GetPage(name: RoutesConstant.userChat, page: () => const ChatUSersScreen()),
  GetPage(
      name: RoutesConstant.userVendorProfile,
      page: () => const UserVendorProfile()),
  GetPage(
      name: RoutesConstant.userMessagesScreen,
      page: () => const UserMessagesScreen()),
  GetPage(name: RoutesConstant.vendorIntro, page: () => const VendorsIntro()),
  GetPage(
      name: RoutesConstant.vendorRegister,
      page: () => const VendorRegistration()),
  GetPage(name: RoutesConstant.vendorLogin, page: () => const VendorLogin()),
  GetPage(
      name: RoutesConstant.vendorNavigation,
      page: () => const VendorNavigationScreen()),
  GetPage(
      name: RoutesConstant.emailVerification,
      page: () => const EmailVerificationScreen()),
  GetPage(
      name: RoutesConstant.otpVerification,
      page: () => const OTPVerificationScreen()),
  GetPage(
      name: RoutesConstant.forgotPassword,
      page: () => const ForgotPasswordScreen()),
  GetPage(
      name: RoutesConstant.resetPassword,
      page: () => const PasswordResetScreen()),
];
