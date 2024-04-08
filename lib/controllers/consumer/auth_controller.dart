import 'package:get_storage/get_storage.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:function_world_app/constants/routes_constant.dart';
import 'package:function_world_app/models/auth_model.dart';
import 'package:function_world_app/services/auth_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  AuthModel? auth_model;

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

  registerConsumer(String name, String email, String password) async {
    try {
      isLoading(false);
      auth_model = await AuthService.register(name, email, password);
      final storage = new FlutterSecureStorage();
      if (auth_model != null) {
        storage.write(key: "FWORLD_JWT_TOKEN", value: auth_model?.data);
        Get.toNamed(RoutesConstant.emailVerification, arguments: email);
      } else {
        Get.snackbar("", "Something went wrong");
      }
    } on Exception catch (e) {
      print('Error while getting data is $e');
    } finally {
      isLoading(false);
    }
  }

  loginConsumer(String email, String password) async {
    try {
      isLoading(false);
      auth_model = await AuthService.login(email, password);
      final storage = new FlutterSecureStorage();
      if (auth_model != null) {
        storage.write(key: "FWORLD_JWT_TOKEN", value: auth_model?.data);
        print(auth_model?.data);
        box.write('email', email);
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
