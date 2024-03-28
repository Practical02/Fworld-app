
import 'package:function_world_app/constants/routes_constant.dart';
import 'package:function_world_app/pages/users/chat_list.dart';
import 'package:function_world_app/pages/users/navigation.dart';
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
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage> getPages = [

  GetPage(name: RoutesConstant.userIntro, page: () => UserIntro()),
  GetPage(name: RoutesConstant.userRegister, page: () => UserRegistration()),
  GetPage(name: RoutesConstant.userLogin, page: () => UserLogin()),
  GetPage(name: RoutesConstant.userNavigation, page: () => NavigationScreen()),
  GetPage(name: RoutesConstant.userChat, page: () => ChatUSersScreen()),


  GetPage(name: RoutesConstant.vendorIntro, page: () => VendorsIntro()),
  GetPage(name: RoutesConstant.vendorRegister, page: () => VendorRegistration()),
  GetPage(name: RoutesConstant.vendorLogin, page: () => VendorLogin()),
  GetPage(name: RoutesConstant.vendorIntro, page: () => VendorNavigationScreen()),


  GetPage(name: RoutesConstant.emailVerification, page: () => EmailVerificationScreen()),
  GetPage(name: RoutesConstant.otpVerification, page: () => OTPVerificationScreen()),
  GetPage(name: RoutesConstant.forgotPassword, page: () => ForgotPasswordScreen()),
  GetPage(name: RoutesConstant.resetPassword, page: () => PasswordResetScreen()),
]; 