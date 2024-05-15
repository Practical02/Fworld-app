import 'package:flutter/material.dart';
import 'package:function_world_app/services/vendor_service_grpc.dart';
import 'package:function_world_app/src/generated/vendor.pb.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:function_world_app/constants/routes_constant.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PortfolioController extends GetxController {

  late TextEditingController nameController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController descriptionController = TextEditingController();
  late TextEditingController servicesController = TextEditingController();
  late TextEditingController instagramController = TextEditingController();
  late TextEditingController facebookController = TextEditingController();

  ImagePicker picker = ImagePicker();

  var profile = UpdateDetailsResponse().obs;
  var image = XFile("").obs;
  var isLoading = false.obs;
  var imageInitialized = false.obs;
  final storage = FlutterSecureStorage();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> updateDetails() async {
      isLoading(true);
      final token = await storage.read(key: "FWORLD_VENDOR_TOKEN"); 
      if(token != null) {
        var profileUpdateResp = await VendorService.updateDetails(token, nameController.text, phoneController.text, descriptionController.text, servicesController.text);
        if(profileUpdateResp != null) {
          isLoading(false);
          Get.snackbar("Profile Update", profileUpdateResp.message);
          Get.offAllNamed(RoutesConstant.vendorGallery);
        }
      } else {
        isLoading(false);
        Get.snackbar("", "Something went wrong");
        Get.toNamed(RoutesConstant.userLogin);
      }
  }

  Future<void> updateSocials() async {
    isLoading(true);
    final token = await storage.read(key: "FWORLD_VENDOR_TOKEN"); 
    if(token != null) {
      if(imageInitialized.isTrue) {
          var profileUpdateResp = await VendorService.updateSocials(token, await image.value.readAsBytes(), image.value.path, instagramController.text, facebookController.text);
          if(profileUpdateResp != null) {
            isLoading(false);
            Get.snackbar("Profile Update", profileUpdateResp.message);
            Get.offAllNamed(RoutesConstant.userNavigation);
          }
      } else {
        Get.snackbar("", "Choose a profile picture");
      }
    } else {
      isLoading(false);
      Get.snackbar("", "Something went wrong");
      Get.toNamed(RoutesConstant.userLogin);
    }
  }

}
