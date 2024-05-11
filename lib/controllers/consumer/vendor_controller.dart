import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:function_world_app/constants/routes_constant.dart';
import 'package:function_world_app/services/consumer_service_grpc.dart';
import 'package:function_world_app/src/generated/consumer.pb.dart';
import 'package:get/get.dart';

class VendorController extends GetxController {
  var vendor = VendorResponse().obs;
  var isFollowed = RxBool(false);
  var isLiked = RxBool(false);
  var isFavourited = RxBool(false);
  var isLoading = true.obs;
  var followers = 0.obs;
  var likes = 0.obs;

  final storage = FlutterSecureStorage();


  Future<void> getVendor(String vendorID) async {
      isLoading(true);
      final token = await storage.read(key: "FWORLD_CONSUMER_TOKEN");
      if(token != null) {
        var vendorResp = await ConsumerService.getVendor(token, vendorID);
        if(vendorResp != null) {
          vendor(vendorResp);
          isLiked(vendorResp.vendor.isLiked);
          isFavourited(vendorResp.vendor.isFavourited);
          isFollowed(vendorResp.vendor.isFollowed);
          followers(vendorResp.vendor.followers.toInt());
          likes(vendorResp.vendor.likes.toInt());
          isLoading(false);
        }
        isLoading(false);
      } else {
        isLoading(false);
        Get.snackbar("", "Something went wrong");
        Get.offAndToNamed(RoutesConstant.userLogin);
      }
  }

  void toggleFollowed() async {
    final token = await storage.read(key: "FWORLD_CONSUMER_TOKEN");
    if(token != null) {
      final followResp = await ConsumerService.follow(token, vendor.value.vendor.iD);
      if(followResp != null) {
        followers.value = isFollowed.value ? (followers.value == 0 ? 0 : followers.value - 1): followers.value + 1;
        isFollowed(!isFollowed.value);
      }
    } else {
        Get.snackbar("", "Something went wrong");
        Get.offAndToNamed(RoutesConstant.userLogin);
    }
  }

  void toggleLiked() async {
    final token = await storage.read(key: "FWORLD_CONSUMER_TOKEN");
    if(token != null) {
      final likeResp = await ConsumerService.like(token, vendor.value.vendor.iD);
      if(likeResp != null) {
        likes.value = isLiked.value ? (likes.value == 0 ? 0 : likes.value - 1): likes.value + 1;
        isLiked(!isLiked.value);
      }
    } else {
        Get.snackbar("", "Something went wrong");
        Get.offAndToNamed(RoutesConstant.userLogin);
    }
  }

  void toggleFavourited() async {
    final token = await storage.read(key: "FWORLD_CONSUMER_TOKEN");
    if(token != null) {
      final favouriteResp = await ConsumerService.favourite(token, vendor.value.vendor.iD);
      if(favouriteResp != null) {
        isFavourited(!isFavourited.value);
      }
    } else {
        Get.snackbar("", "Something went wrong");
        Get.offAndToNamed(RoutesConstant.userLogin);
    }
  }
}
