import 'package:function_world_app/services/payment_service.dart';
import 'package:get_storage/get_storage.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:function_world_app/constants/routes_constant.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  var isLoading = false.obs;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    GetStorage.init();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  makePayment() async {
    try {
      isLoading(false);
      var result = await PaymentService.makePayment();
      if(result) {
        Get.offAllNamed(RoutesConstant.vendorNavigation);
      } else {
        Get.snackbar("Payment Provider", "Payment not successful");
      }
    } on Exception catch (e) {
      print("error");
      Get.snackbar("Payment Provider", "Payment not successful");
    } finally {
      isLoading(false);
    }
  }

}
