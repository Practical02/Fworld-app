import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:function_world_app/constants/routes_constant.dart';
import 'package:function_world_app/controllers/consumer/profile_controller.dart';
import 'package:function_world_app/pages/users/user_intro.dart';
import 'package:function_world_app/core/app_colors.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileController profileController = Get.put(ProfileController());
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
  }

  Future<void> logout() async {
    await secureStorage.deleteAll();
    Get.offAllNamed(RoutesConstant.userIntro);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (profileController.isLoading.isTrue) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.yellow,
                backgroundColor: Colors.black,
              ),
            );
          } else {
            return Container(
              height: double.maxFinite,
              color: AppColors.offBlack,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        profileController.updateProfilePic();
                      },
                      child: CircleAvatar(
                        radius: 60,
                        foregroundImage: NetworkImage(
                          profileController.profile.value.imageUrl !=
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQz_hPrEDS3XE8LQIEQRNSSMzc8IryJhz_iXQ&s"
                              ? profileController.profile.value.imageUrl
                              : "",
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      profileController.profile.value.name,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.toNamed(RoutesConstant.userProfileEditScreen);
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 76.0),
                            child: Text(
                              "Edit Profile",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: logout,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 76.0),
                        child: Text(
                          "Logout",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class Album {
  final String id;
  final String url;

  Album({
    required this.id,
    required this.url,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'].toString(),
      url: json['download_url'] as String,
    );
  }
}
