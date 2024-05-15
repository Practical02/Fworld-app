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
import 'package:function_world_app/pages/users/user_profile_edit_screen.dart';
import 'package:function_world_app/pages/users/vendor_profile.dart';
import 'package:function_world_app/pages/vendors/vendor_auth/vendor_email_verify.dart';
import 'package:function_world_app/pages/vendors/vendor_auth/vendor_gallery.dart';
import 'package:function_world_app/pages/vendors/vendor_auth/vendor_payment.dart';
import 'package:function_world_app/pages/vendors/vendor_auth/vendor_portfolio.dart';
import 'package:function_world_app/pages/vendors/vendor_auth/vendor_social.dart';
import 'package:function_world_app/pages/vendors/vendor_nav.dart';
import 'package:function_world_app/pages/vendors/vendor_auth/vendors_register.dart';
import 'package:function_world_app/pages/vendors/vendors_intro.dart';
import 'package:function_world_app/pages/vendors/vendor_auth/vendors_login.dart';
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
  GetPage(
      name: RoutesConstant.userProfileEditScreen,
      page: () => const UserProfileEdit()),
  GetPage(name: RoutesConstant.vendorIntro, page: () => const VendorsIntro()),
  GetPage(
      name: RoutesConstant.vendorRegister,
      page: () => const VendorRegistration()),
  GetPage(name: RoutesConstant.vendorLogin, page: () => const VendorLogin()),
  GetPage(
      name: RoutesConstant.vendorNavigation,
      page: () => const VendorNavigationScreen()),
  GetPage(
      name: RoutesConstant.userEmailVerification,
      page: () => const UserEmailVerificationScreen()),
  GetPage(
      name: RoutesConstant.vendorEmailVerification,
      page: () => const VendorEmailVerificationScreen()),
  GetPage(
      name: RoutesConstant.forgotPassword,
      page: () => const ForgotPasswordScreen()),
  GetPage(
      name: RoutesConstant.resetPassword,
      page: () => const PasswordResetScreen()),
  GetPage(
    name: RoutesConstant.payment, 
    page: () => const VendorPaymentGatewayScreen()),
  GetPage(name: RoutesConstant.vendorPortfolio, page: () => const VendorPortfolio()),
  GetPage(name: RoutesConstant.vendorSocials, page: () => const VendorSocial()),
  GetPage(name: RoutesConstant.vendorGallery, page: () => const VendorGallery())
];
