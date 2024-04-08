import 'package:flutter/material.dart';
import 'package:function_world_app/core/app_colors.dart';
import 'package:function_world_app/pages/users/profile_screen.dart';

class VendorNavigationScreen extends StatefulWidget {
  static String routeName = "/vendor/nav";
  const VendorNavigationScreen({super.key});

  @override
  State<VendorNavigationScreen> createState() => VendorNavigationScreenState();
}

class VendorNavigationScreenState extends State<VendorNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offBlack,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        backgroundColor: AppColors.appBarColor,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/icons/Location.png'),
              height: 24,
            ),
            Text(
              "LOC",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
        title: Image(
          image: AssetImage('assets/images/function.png'),
          width: 140,
        ),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
            ),
            onPressed: () {
              // Navigate to chat screen
            },
            child: Image(
              image: AssetImage('assets/icons/Chat.png'),
              width: 28,
            ),
          )
        ],
      ),
      body: ProfileScreen(),
    );
  }
}
