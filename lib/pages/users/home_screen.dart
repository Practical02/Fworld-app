import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:function_world_app/controllers/consumer/feed_controller.dart';
import 'package:function_world_app/core/app_colors.dart';
import 'package:function_world_app/pages/users/vendor_profile.dart';
import 'package:function_world_app/widgets/home_tile.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FeedController feedController = Get.put(FeedController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.offBlack),
      child: Obx(
        () {
          if(feedController.isLoading.isTrue) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return MasonryGridView.count(
                crossAxisCount: 2,
                itemCount: feedController.postList.length,
                itemBuilder: (context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: GestureDetector(
                      onTap: () {
                        // Handle tap
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UserVendorProfile(),
                            ),
                          );
                        },
                        child: HomeTile(
                          imageUrl: feedController.postList[index].url,
                          title: feedController.postList[index].name,
                          subTitle: feedController.postList[index].service,
                        ),
                      ),
                    ),
                  );
                },
              );
          }
        } 
      )
    );
  }
}
