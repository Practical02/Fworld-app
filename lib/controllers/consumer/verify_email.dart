
import 'package:function_world_app/constants/routes_constant.dart';
import 'package:function_world_app/services/consumer_service.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {

  var isLoading = false.obs;

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  verifyOTP(int otp) async {
    try {
      isLoading(false);
      var done = await ConsumerService.verifyOTP(otp);
      if(done) {
        Get.toNamed(RoutesConstant.userNavigation);
      } else {
        Get.snackbar("", "Something went wrong");
      }
    } on Exception catch (e) {
      print('Error while getting data is $e');
    } finally {
      isLoading(false);
    }
  }
}