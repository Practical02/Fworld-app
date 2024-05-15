
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:function_world_app/constants/routes_constant.dart';
import 'package:function_world_app/services/vendor_service_grpc.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {

  var isLoading = false.obs;
  final storage = FlutterSecureStorage();

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  verifyConsumerOTP(int otp) async {
    final token = await storage.read(key: "FWORLD_VENDOR_TOKEN");
    if(token != null) {
      var verifyEmailResp = await VendorService.verifyEmail(token, otp);
      if(verifyEmailResp != null) {
        Get.snackbar("", "OTP Verified Successfully");
        Get.toNamed(RoutesConstant.payment);
      } 
    } else {
        Get.snackbar("", "Something went wrong");
        Get.toNamed(RoutesConstant.userLogin);
    }
  }
}