import 'package:flutter/material.dart';
import 'package:function_world_app/constants/routes_constant.dart';
import 'package:function_world_app/core/app_colors.dart';
import 'package:function_world_app/pages/users/favourites_screen.dart';
import 'package:function_world_app/pages/users/home_screen.dart';
import 'package:function_world_app/pages/users/location.dart';
import 'package:function_world_app/pages/users/profile_screen.dart';
import 'package:function_world_app/pages/users/vendor_profile.dart';
import 'package:function_world_app/pages/users/vendors_screen.dart';
import 'package:function_world_app/widgets/navbar_item.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NavigationScreen extends StatefulWidget {
  static String routeName = "/user/nav";
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  String selected = "Home";
  String locationText = "LOC"; // Default location text

  final Map<String, Widget> screens = {
    "Home": const HomeScreen(),
    "Vendors": const VendorsScreen(),
    "Favourites": const FavouritesScreen(),
    "Profile": const ProfileScreen(),
    "VendorProfile": const UserVendorProfile(),
  };

  @override
  void initState() {
    super.initState();
    _getLocationText();
  }

  void _getLocationText() async {
    final box = GetStorage();
    String? location = box.read('selected_location');
    setState(() {
      if (location != null && location.isNotEmpty) {
        locationText = location.substring(0, 3).toUpperCase();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          backgroundColor: AppColors.offBlack,
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 70,
            backgroundColor: AppColors.appBarColor,
            leading: GestureDetector(
              onTap: () {
                Get.to(() => UserLocationScreen());
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage('assets/icons/Location.png'),
                    height: 24,
                  ),
                  Text(
                    locationText,
                    style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
            title: const Image(
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
                  Get.toNamed(RoutesConstant.userChat);
                },
                child: const Image(
                  image: AssetImage('assets/icons/Chat.png'),
                  width: 28,
                ),
              )
            ],
          ),
          body: screens[selected],
          bottomNavigationBar: NavigationBar(
            backgroundColor: AppColors.bottomBarColor,
            destinations: [
              NavBarItem(
                imageURL: 'assets/icons/Home.png',
                label: "Home",
                selected: selected,
                onTap: () {
                  setState(() {
                    selected = "Home";
                  });
                },
              ),
              NavBarItem(
                imageURL: 'assets/icons/Vendors.png',
                label: "Vendors",
                selected: selected,
                onTap: () {
                  setState(() {
                    selected = "Vendors";
                  });
                },
              ),
              NavBarItem(
                imageURL: 'assets/icons/Favs.png',
                label: "Favourites",
                selected: selected,
                onTap: () {
                  setState(() {
                    selected = "Favourites";
                  });
                },
              ),
              NavBarItem(
                imageURL: 'assets/icons/User.png',
                label: "Profile",
                selected: selected,
                onTap: () {
                  setState(
                    () {
                      selected = "Profile";
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
