import 'package:flutter/material.dart';
import 'package:function_world_app/core/app_colors.dart';
import 'package:function_world_app/pages/users/chat_list.dart';
import 'package:function_world_app/pages/users/favourites_screen.dart';
import 'package:function_world_app/pages/users/home_screen.dart';
import 'package:function_world_app/pages/users/profile_screen.dart';
import 'package:function_world_app/pages/users/vendor_profile.dart';
import 'package:function_world_app/pages/users/vendors_screen.dart';
import 'package:function_world_app/widgets/navbar_item.dart';

class VendorNavigationScreen extends StatefulWidget {
  static String routeName = "/vendor/nav";
  const VendorNavigationScreen({super.key});

  @override
  State<VendorNavigationScreen> createState() => Vendor_NavigationScreenState();
}

class Vendor_NavigationScreenState extends State<VendorNavigationScreen> {
  String selected = "Home";

  setScreen(String name) {
    setState(() {
      selected = "Home";
    });
  }

  final Map<String, Widget> screens = {
    "Home": const HomeScreen(),
    "Vendors": const VendorsScreen(),
    "Favourites": const FavouritesScreen(),
    "Profile": const ProfileScreen(),
    "VendorProfile": const UserVendorProfile(),
  };

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
            leading: const Column(
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
                      fontSize: 12),
                ),
              ],
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
                  Navigator.of(context).pushNamed(ChatUSersScreen.routeName);
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
