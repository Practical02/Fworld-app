import 'package:function_world_app/controllers/consumer/auth_controller.dart';
import 'package:get/get.dart';

class UserRegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
          () => AuthController(),
    );
  }
}