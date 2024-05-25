import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:function_world_app/pages/users/navigation.dart';
import 'package:function_world_app/pages/vendors/vendor_nav.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:function_world_app/constants/get_pages_constant.dart';
import 'package:function_world_app/core/app_colors.dart';
import 'package:function_world_app/firebase_options.dart';
import 'package:function_world_app/pages/users/user_intro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await dotenv.load(fileName: "assets/.env");

  Stripe.publishableKey =
      "pk_test_51Nx8zZSBQ76eXznrjdb0O6Y0SIZwU7OcdvvngZc7wxxkiKpAEsAWLN2WFpON2vVzhYZ6Z5o3H6XHyx4jQelGbrdl00lS2uPbB5";

  final storage = FlutterSecureStorage();
  final isLoggedIn = await storage.read(key: 'isLoggedIn') == 'true';
  final userType = await storage.read(key: 'userType');

  runApp(MyApp(isLoggedIn: isLoggedIn, userType: userType));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  final String? userType;

  const MyApp({super.key, required this.isLoggedIn, this.userType});

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
      home: isLoggedIn
          ? (userType == 'vendor'
              ? VendorNavigationScreen()
              : NavigationScreen())
          : UserIntro(),
      getPages: getPages,
    );
  }
}
