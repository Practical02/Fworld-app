import 'package:cached_network_image/cached_network_image.dart';
import 'package:function_world_app/constants/routes_constant.dart';
import 'package:function_world_app/controllers/consumer/vendor_controller.dart';
import 'package:function_world_app/models/chat_user.dart';
import 'package:function_world_app/pages/users/user_chat.dart';
import 'package:function_world_app/widgets/gallery_tile.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:function_world_app/core/app_colors.dart';
import 'package:get_storage/get_storage.dart';

class UserVendorProfile extends StatefulWidget {
  const UserVendorProfile({super.key});

  @override
  State<UserVendorProfile> createState() => _UserVendorProfileState();
}

class _UserVendorProfileState extends State<UserVendorProfile> {
  final VendorController vendorController = Get.put(VendorController());

  late String vendorID;

  @override
  void initState() {
    vendorID = Get.arguments["vendorID"];
    vendorController.getVendor(vendorID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (vendorController.isLoading.isTrue) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Container(
          color: AppColors.offBlack,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).width * 0.8,
                  width: MediaQuery.sizeOf(context).width,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: CachedNetworkImage(
                    imageUrl: vendorController.vendor.value.vendor.posts[0].imageURL,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    imageBuilder: (context, imageProvider) {
                      return Image(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                vendorController.vendor.value.vendor.name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${vendorController.followers.value} followers",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                "${vendorController.likes.value} likes",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  vendorController.toggleLiked();
                                },
                                icon: Image(
                                  image: AssetImage(
                                      vendorController.isLiked.value
                                          ? 'assets/icons/likeActive.png'
                                          : 'assets/icons/like.png'),
                                  height: 28,
                                ),
                              ),
                              Text(
                                "${vendorController.likes.value} likes",
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 9,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              vendorController.toggleFollowed();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border:
                                      Border.all(color: AppColors.primaryColor),
                                  color: vendorController.isFollowed.value
                                      ? AppColors.primaryColor
                                      : Colors.transparent),
                              child: Text(
                                vendorController.isFollowed.value
                                    ? "Following"
                                    : "Follow",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              vendorController.toggleFavourited();
                            },
                            icon: Image(
                              image: AssetImage(
                                  vendorController.isFavourited.value
                                      ? 'assets/icons/starActive.png'
                                      : 'assets/icons/star.png'),
                              height: 20,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final box = GetStorage();
                    String? currentUserEmail = box.read('email');
                    print(currentUserEmail);

                    if (currentUserEmail != null && currentUserEmail != "") {
                      // Check if the vendor exists in the Firestore database
                      ChatUser? vendor =
                          await ChatUser.getVendorIfExists(vendorID);

                      if (vendor != null) {
                        // Vendor exists, add current user email to participants
                        await vendor.addParticipant(currentUserEmail);
                        // Navigate to the messages screen with vendor details
                        navigateToUserMessagesScreen(
                          currentUserEmail,
                          vendorID, // Assuming widget.id is the vendor's ID
                        );
                      } else {
                        // Vendor does not exist, create a new ChatUser instance for the vendor
                        vendor = ChatUser(
                          id: vendorID,
                          photoUrl: '', // You can add appropriate values here
                          displayName: vendorController.vendor.value.vendor
                              .name, // You can add appropriate values here
                          phoneNumber: "", // You can add appropriate values here
                          aboutMe: '', // You can add appropriate values here
                          participants: [
                            currentUserEmail
                          ], // Add current user's email as participant
                        );
                        // Add the vendor to the Firestore database
                        await vendor.addVendorToChatUserModel();
                        // Navigate to the messages screen with vendor details
                        navigateToUserMessagesScreen(
                          currentUserEmail,
                          vendorID, // Assuming widget.id is the vendor's ID
                        );
                      }
                    } else {
                      // Handle case when user email is not available
                      print('User email not found in SharedPreferences');
                    }
                  },
                  child: Icon(Icons.message, color: Colors.white),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.buttonColor),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                const Text(
                  "We provide the best",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  "Our team is composed of highly skilled event planners, coordinators, designers, and logistical experts who thrive on turning your vision into reality. We understand that each event is unique, and we pride ourselves on delivering personalized solutions tailored to your specific needs and goals.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                const Text(
                  "Our Gallery",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 14,
                      ),
                      itemCount:
                          vendorController.vendor.value.vendor.posts.length,
                      itemBuilder: (context, index) {
                        return GalleryTile(
                          imageUrl: vendorController
                              .vendor.value.vendor.posts[index].imageURL,
                        );
                      },
                    )),
              ],
            ),
          ),
        );
      }
    }));
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

void navigateToUserMessagesScreen(String userEmail, String receiverEmail) {
  Get.toNamed(RoutesConstant.userMessagesScreen,
      arguments: {'userEmail': userEmail, 'receiverEmail': receiverEmail});
}
