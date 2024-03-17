import 'package:flutter/material.dart';
import 'package:function_world_app/core/app_colors.dart';
import 'package:function_world_app/pages/users/user_intro.dart';
import 'package:function_world_app/pages/vendors/vendor_registeration/vendors_register.dart';
import 'package:function_world_app/pages/vendors/vendors_login.dart';

class VendorsIntro extends StatefulWidget {
  static String routeName = "/vendor/intro";
  const VendorsIntro({super.key});

  @override
  State<VendorsIntro> createState() => _VendorsIntroState();
}

class _VendorsIntroState extends State<VendorsIntro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                // ignore: prefer_const_literals_to_create_immutables
                colors: [
                  Color.fromRGBO(0, 0, 0, 1),
                  Color.fromRGBO(0, 0, 0, 0.47),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/Fworld-Logo.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome to",
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      " FunctionWorld",
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                TextButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(
                      Size.fromWidth(MediaQuery.sizeOf(context).width * 0.8),
                    ),
                    padding: const MaterialStatePropertyAll(
                      EdgeInsetsDirectional.symmetric(
                        vertical: 12,
                      ),
                    ),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    backgroundColor:
                        const MaterialStatePropertyAll(AppColors.primaryColor),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(VendorLogin.routeName);
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(
                      Size.fromWidth(MediaQuery.sizeOf(context).width * 0.8),
                    ),
                    padding: const MaterialStatePropertyAll(
                      EdgeInsetsDirectional.symmetric(
                        vertical: 12,
                      ),
                    ),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    backgroundColor: const MaterialStatePropertyAll(
                      Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, VendorRegistration.routeName);
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, UserIntro.routeName, (route) => false);
                  },
                  child: const Text(
                    "Login/Create User Account",
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                // Column(
                //   children: [
                //     Text("Or login with"),

                //   ],
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
