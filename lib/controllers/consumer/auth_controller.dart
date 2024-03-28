import 'dart:ffi';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:function_world_app/constants/routes_constant.dart';
import 'package:function_world_app/models/auth_model.dart';
import 'package:function_world_app/services/auth_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  AuthModel? auth_model;

  var isLoading = false.obs;

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  registerVendor(String name, String email, String password) async {
    try {
      isLoading(false);
      auth_model = await AuthService.register(name, email, password);
      final storage = new FlutterSecureStorage();
      if(auth_model != null) {
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
}