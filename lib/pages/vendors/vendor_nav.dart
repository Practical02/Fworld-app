import 'package:flutter/material.dart';
import 'package:function_world_app/constants/routes_constant.dart';
import 'package:function_world_app/core/app_colors.dart';
import 'package:function_world_app/pages/vendors/vendor_profile_screen.dart';
import 'package:get/get.dart';

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
              Get.toNamed(RoutesConstant.vendorChat);
            },
            child: Image(
              image: AssetImage('assets/icons/Chat.png'),
              width: 28,
            ),
          )
        ],
      ),
      body: VendorProfileScreen(),
    );
  }
}
