import 'package:function_world_app/models/vendor_model.dart';
import 'package:function_world_app/services/consumer_service.dart';
import 'package:get/get.dart';

class VendorController extends GetxController {
  var vendor = VendorModel.empty().obs;
  var isFollowed = RxBool(false);
  var isLiked = RxBool(false);
  var isFavourited = RxBool(false);
  var isLoading = false.obs;

  Future<void> getVendor(String vendorID) async {
    try {
      isLoading(true); // Set loading to true before fetching data
      var vendorModel = await ConsumerService.fetchVendor(vendorID);
      if (vendorModel != null) {
        vendor.value = vendorModel;
        isFollowed(vendorModel.data.isFollowed);
        isLiked(vendorModel.data.isLiked);
        isFavourited(vendorModel.data.isFavourited);
         // Update current page
      } else {
        Get.snackbar("", "Something went wrong");
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isLoading(false); // Set loading to false after fetching data
    }
  }

  void toggleFollowed() async {
    var isFollowedValue = await ConsumerService.followVendor(vendor.value.data.vendorId);
    if(isFollowedValue) {
      var temp = vendor.value;
      temp.data.followers = isFollowed.value ? (temp.data.followers == 0 ? 0 : temp.data.followers - 1) : temp.data.followers + 1;
      vendor(temp);
      isFollowed(!isFollowed.value);
    } else {
      Get.snackbar("", "Something went wrong");
    }
  }

  void toggleLiked() async {
    var isLikedValue = await ConsumerService.likeVendor(vendor.value.data.vendorId);
    if(isLikedValue) {
      var temp = vendor.value;
      temp.data.likes = isLiked.value ? temp.data.likes - 1 : temp.data.likes + 1;
      vendor(temp);
      isLiked(!isLiked.value);
    } else {
      Get.snackbar("", "Something went wrong");
    }
  }

  void toggleFavourited() async {
    var isFavouritedValue = await ConsumerService.favouriteVendor(vendor.value.data.vendorId);
    if(isFavouritedValue) {
      isFavourited(!isFavourited.value);
    } else {
      Get.snackbar("", "Something went wrong");
    }
  }
}
