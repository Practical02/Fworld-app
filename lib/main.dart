import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:function_world_app/constants/get_pages_constant.dart';
import 'package:function_world_app/core/app_colors.dart';
import 'package:function_world_app/firebase_options.dart';
import 'package:function_world_app/pages/users/user_intro.dart';
import 'package:function_world_app/pages/vendors/vendor_registeration/vendor_payment.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await dotenv.load(fileName: "assets/.env");

  Stripe.publishableKey =
      "pk_test_51Nx8zZSBQ76eXznrjdb0O6Y0SIZwU7OcdvvngZc7wxxkiKpAEsAWLN2WFpON2vVzhYZ6Z5o3H6XHyx4jQelGbrdl00lS2uPbB5";
  runApp(MyApp());
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
      home: VendorPaymentGatewayScreen(),
      getPages: getPages,
    );
  }
}
