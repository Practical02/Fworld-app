import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:function_world_app/constants/routes_constant.dart';
import 'package:function_world_app/services/consumer_service_grpc.dart';
import 'package:function_world_app/src/generated/consumer.pb.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  late TextEditingController nameController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  ImagePicker picker = ImagePicker();

  var profile = ProfileResponse().obs;
  var message = UpdateProfileResponse().obs;
  var image = XFile("").obs;
  var isLoading = false.obs;
  final storage = FlutterSecureStorage();

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  Future<void> getProfile() async {
      isLoading(true);
      final token = await storage.read(key: "FWORLD_CONSUMER_TOKEN"); 
      if(token != null) {
        var profileResp = await ConsumerService.getProfile(token);
        if(profileResp != null) {
          profile.value = profileResp;
          nameController.text = profileResp.name;
          phoneController.text = profileResp.phone;
          isLoading(false);
        }
      } else {
        isLoading(false);
        Get.snackbar("", "Something went wrong");
        Get.toNamed(RoutesConstant.userLogin);
      }
  }

  Future<void> updateProfile() async {
      isLoading(true);
      final token = await storage.read(key: "FWORLD_CONSUMER_TOKEN"); 
      if(token != null) {
        var profileUpdateResp = await ConsumerService.updateProfile(token, nameController.text, phoneController.text);
        if(profileUpdateResp != null) {
          message.value = profileUpdateResp;
          isLoading(false);
          Get.snackbar("Profile Update", message.value.message);
          Get.offAllNamed(RoutesConstant.userNavigation);
        }
      } else {
        isLoading(false);
        Get.snackbar("", "Something went wrong");
        Get.toNamed(RoutesConstant.userLogin);
      }
  }

  Future<void> updateProfilePic() async {
      isLoading(true);
      final token = await storage.read(key: "FWORLD_CONSUMER_TOKEN"); 
      if(token != null) {
        final XFile? imageF = await picker.pickImage(source: ImageSource.gallery);
        if(imageF != null) {
          var imageData = await imageF.readAsBytes(); 
          var profilePicUpdateResp = await ConsumerService.updateProfilePic(token, imageF.path, imageData);
          if(profilePicUpdateResp != null) {
            isLoading(false);
            Get.snackbar("Profile Pic Update", message.value.message);
            Get.offAllNamed(RoutesConstant.userNavigation);
          }
        } else {
          isLoading(false);
          Get.snackbar("", "Something went wrong");
        }        
      } else {
        isLoading(false);
        Get.snackbar("", "Something went wrong");
        Get.toNamed(RoutesConstant.userLogin);
      }    
  }

}
